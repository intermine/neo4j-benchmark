package org.intermine.neo4j.plugin.rest;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.StreamingOutput;

import org.codehaus.jackson.JsonEncoding;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.ObjectMapper;
import org.intermine.neo4j.plugin.model.BenchmarkMode;
import org.intermine.neo4j.plugin.model.Gene;
import org.intermine.neo4j.plugin.model.IntermineLabel;
import org.intermine.neo4j.plugin.model.IntermineRelationships;
import org.intermine.neo4j.plugin.model.LocatedOn;
import org.intermine.neo4j.plugin.traversal.OverlappingEvaluator;
import org.neo4j.graphdb.Direction;
import org.neo4j.graphdb.GraphDatabaseService;
import org.neo4j.graphdb.Node;
import org.neo4j.graphdb.NotFoundException;
import org.neo4j.graphdb.Relationship;
import org.neo4j.graphdb.Result;
import org.neo4j.graphdb.Transaction;
import org.neo4j.graphdb.traversal.Evaluators;
import org.neo4j.graphdb.traversal.TraversalDescription;
import org.neo4j.graphdb.traversal.Traverser;
import org.neo4j.helpers.collection.MapUtil;
import org.neo4j.logging.Log;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Path( "/overlapping" )
public class Overlapping
{
    private final GraphDatabaseService database;
    private final ObjectMapper objectMapper;
    @Context public Log log;

    public Overlapping(@Context GraphDatabaseService database)
    {
        this.database = database;
        objectMapper = new ObjectMapper();
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/api/{lookup}")
    public Response overlappingWitAPI(@PathParam( "lookup" ) String lookup ) throws IOException {
        return overlapping(lookup, BenchmarkMode.API);
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/traversal/{lookup}")
    public Response overlappingWithTraversal(@PathParam( "lookup" ) String lookup ) throws IOException {
        return overlapping(lookup, BenchmarkMode.TRAVERSAL);
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/norelation/{lookup}")
    public Response overlappingWithNoRelation(@PathParam( "lookup" ) String lookup ) throws IOException {
        return overlapping(lookup, BenchmarkMode.NO_RELATION);
    }

    public Response overlapping(String lookup, BenchmarkMode mode) throws IOException {
        long start = System.currentTimeMillis();
        Gene gene = getLookupGene(lookup, mode);
        if (gene == null) {
            return Response.status(Response.Status.NOT_FOUND).entity("Gene not found").build();
        }
        long time = System.currentTimeMillis() - start;
        log.info("execution time for " + ((mode == BenchmarkMode.API) ? "api" : "traversal") + " call: " + time);
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json = gson.toJson(gene);
        return Response.ok(json, MediaType.APPLICATION_JSON).build();
    }

    private Gene getLookupGene(String lookup, BenchmarkMode mode) {
        Transaction transaction = null;
        Gene gene = null;
        try {
            transaction = database.beginTx();
            Node geneNode = lookupGeneNode(lookup);
            if (geneNode != null) {
                if (mode == BenchmarkMode.API) {
                    gene = getGene(geneNode);
                } else if (mode == BenchmarkMode.TRAVERSAL) {
                    gene = getGeneWithTraversal(geneNode);
                }  else if (mode == BenchmarkMode.NO_RELATION) {
                    gene = getGeneWithNoOverlapsRelation(geneNode);
                }
            }
            transaction.success();
        } finally {
            transaction.close();
        }
        return gene;
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/streaming/{lookup}")
    public Response overlappingWitStreaming(@PathParam( "lookup" ) String lookup) throws IOException {
        StreamingOutput stream = new StreamingOutput() {
            @Override
            public void write(OutputStream os) throws IOException, WebApplicationException {
                JsonGenerator jg = objectMapper.getJsonFactory().createJsonGenerator(os, JsonEncoding.UTF8);

                try (Transaction tx = database.beginTx()) {
                    Node geneNode = lookupGeneNode(lookup);
                    if (geneNode != null) {
                        jg.writeStartObject();
                        jg.writeObjectField("primaryIdentifier", geneNode.getProperty("primaryidentifier"));
                        jg.writeObjectField("secondaryIdentifier", geneNode.getProperty("secondaryidentifier"));
                        jg.writeObjectField("symbol", geneNode.getProperty("symbol"));
                        writeLocation(jg, geneNode);
                        jg.writeFieldName("overlappingGenes");
                        jg.writeStartArray();
                        for (Relationship overlaps : geneNode.getRelationships(IntermineRelationships.OVERLAPS, Direction.BOTH)) {
                            Node overlappingGeneNode = (overlaps.getStartNode().getId() != geneNode.getId()) ? overlaps.getStartNode() : overlaps.getEndNode();
                            jg.writeStartObject();
                            jg.writeObjectField("primaryIdentifier", overlappingGeneNode.getProperty("primaryidentifier"));
                            jg.writeObjectField("symbol", overlappingGeneNode.getProperty("symbol"));
                            writeLocation(jg, overlappingGeneNode);
                            jg.writeEndObject();;
                        }
                        jg.writeEndArray();
                        jg.writeEndObject();
                    }
     
                    tx.success();
                }
                jg.flush();
                jg.close();
            }
        };
        return Response.ok().entity(stream).type(MediaType.APPLICATION_JSON).build();
    }

    private void writeLocation(JsonGenerator jg, Node gene) throws IOException {
        jg.writeFieldName("location");
        for (Relationship located : gene.getRelationships(IntermineRelationships.LOCATED_ON, Direction.OUTGOING)) {
            jg.writeStartObject();
            jg.writeObjectField("chromosome", located.getEndNode().getProperty("primaryidentifier"));
            jg.writeObjectField("start", located.getProperty("start"));
            jg.writeObjectField("end", located.getProperty("end"));
            jg.writeObjectField("strand", located.getProperty("strand"));
            jg.writeEndObject();
            break;
        }
    }

    private Node lookupGeneNode(String lookup) {
        Node gene = findGene("id", lookup);
        if (gene != null) {
            return gene;
        }
        gene = findGene("primaryidentifier", lookup);
        if (gene != null) {
            return gene;
        }
        gene = findGene("secondaryidentifier", lookup);
        if (gene != null) {
            return gene;
        }
        gene = findGene("symbol", lookup);
        if (gene != null) {
            return gene;
        }
        gene = findGene("name", lookup);
        if (gene != null) {
            return gene;
        }
        return null;
    }

    private Node findGene(String property, String value) {
        return database.findNode(IntermineLabel.gene, property, value);
    }

    private Gene getGene(Node node) {
        Gene gene = new Gene();
        gene.setPrimaryIdentifier((String) node.getProperty("primaryidentifier"));
        gene.setSecondaryIdentifier((String) node.getProperty("secondaryidentifier"));
        try {
            gene.setSymbol((String) node.getProperty("symbol"));
        } catch (NotFoundException nfe) {
            log.info("the node " + (String) node.getProperty("primaryidentifier") + " doesn't have a symbol");
        }
        List<Gene> overlappingGenes = new ArrayList<Gene>();
        for (Relationship overlaps : node.getRelationships(IntermineRelationships.OVERLAPS, Direction.BOTH)) {
            Node overlappingGeneNode = overlaps.getOtherNode(node);
            if (overlappingGeneNode.hasLabel(IntermineLabel.gene)) {
                Gene overlappingGene = new Gene((String) overlappingGeneNode.getProperty("primaryidentifier"));
                try {
                    overlappingGene.setSymbol((String) overlappingGeneNode.getProperty("symbol"));
                } catch (NotFoundException nfe) {
                    log.info("the node " + (String) overlappingGeneNode.getProperty("primaryidentifier") + " doesn't have a symbol");
                }
                overlappingGene.setLocation(getLocation(overlappingGeneNode));
                overlappingGenes.add(overlappingGene);
            }
        }
        gene.setOverlappingGenes(overlappingGenes);
        gene.setLocation(getLocation(node));
        return gene;
    }

    private Gene getGeneWithTraversal(Node node) {
        Gene gene = new Gene();
        gene.setPrimaryIdentifier((String) node.getProperty("primaryidentifier"));
        gene.setSecondaryIdentifier((String) node.getProperty("secondaryidentifier"));
        gene.setSymbol((String) node.getProperty("symbol"));
        List<Gene> overlappingGenes = new ArrayList<Gene>();
        TraversalDescription traversal = database.traversalDescription()
                .breadthFirst()
                .relationships(IntermineRelationships.OVERLAPS, Direction.BOTH)
                .evaluator(Evaluators.excludeStartPosition());
        Traverser traverser = traversal.traverse(node);
        for (Node overlappingGeneNode : traverser.nodes()) {
            Gene overlappingGene = new Gene((String) overlappingGeneNode.getProperty("primaryidentifier"));
            overlappingGene.setSymbol((String) overlappingGeneNode.getProperty("symbol"));
            overlappingGene.setLocation(getLocation(overlappingGeneNode));
            overlappingGenes.add(overlappingGene);
        }
        gene.setOverlappingGenes(overlappingGenes);
        gene.setLocation(getLocation(node));
        return gene;
    }

    private Gene getGeneWithNoOverlapsRelation(Node node) {
        Gene gene = new Gene();
        gene.setPrimaryIdentifier((String) node.getProperty("primaryidentifier"));
        gene.setSecondaryIdentifier((String) node.getProperty("secondaryidentifier"));
        gene.setSymbol((String) node.getProperty("symbol"));
        List<Gene> overlappingGenes = new ArrayList<Gene>();
        TraversalDescription traversal = database.traversalDescription()
                .breadthFirst()
                .relationships(IntermineRelationships.LOCATED_ON, Direction.OUTGOING)
                .evaluator(Evaluators.toDepth(1));
        Traverser traverser = traversal.traverse(node);
        long start = 0;
        long end = 0;
        long strand = 0;
        for (Relationship locatedOn : traverser.relationships()) {
            start = (Long)locatedOn.getProperty("start");
            end = (Long)locatedOn.getProperty("end");
            strand = (Long)locatedOn.getProperty("strand");
            break;
        }
        TraversalDescription overlappingTraversal = database.traversalDescription()
                .breadthFirst()
                .relationships(IntermineRelationships.LOCATED_ON, Direction.BOTH)
                .evaluator(new OverlappingEvaluator(start, end));
        Traverser overlappingTraverser = overlappingTraversal.traverse(node);
        for (Node overlappingGeneNode : overlappingTraverser.nodes()) {
            Gene overlappingGene = new Gene((String) overlappingGeneNode.getProperty("primaryidentifier"));
            overlappingGene.setSymbol((String) overlappingGeneNode.getProperty("symbol"));
            overlappingGene.setLocation(getLocation(overlappingGeneNode));
            overlappingGenes.add(overlappingGene);
        }
        gene.setOverlappingGenes(overlappingGenes);
        gene.setLocation(new LocatedOn(start, end, strand));
        return gene;
    }

    @GET
    @Produces( MediaType.TEXT_PLAIN )
    @Path( "/cypher/{lookup}" )
    public Response overlappingWithCypher(@PathParam( "lookup" ) String lookup ) throws IOException {
        long start = System.currentTimeMillis();
        Transaction transaction = null;
        Gene gene = null;
        try {
            transaction = database.beginTx();
            String id = getGeneId(lookup);
            if (id == null) {
                return Response.status(Response.Status.NOT_FOUND).entity("Gene not found").build();
            }
            final Map<String, Object> params = MapUtil.map("id", id);
            Result result = database.execute(getQueryString(), params);
            gene = getGene(result);
            transaction.success();
        } finally {
            transaction.close();
        }
        long time = System.currentTimeMillis() - start;
        log.info("execution time for cypher call: " + time);
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json = gson.toJson(gene);
        return Response.ok(json, MediaType.APPLICATION_JSON).build();
    }

    private String getGeneId(String lookup) {
        final Map<String, Object> params = MapUtil.map("lookup", lookup);
        Result result = database.execute(getGeneIdQueryString(), params);
        if (!result.hasNext()) {
            return null;
        }
        Map<String,Object> row = result.next();
        return row.get("id").toString();
    }

    private Gene getGene(final Result result) {
        Gene gene = new Gene();
        Map<String,Object> row = result.next();
        if (row != null) {
            gene.setPrimaryIdentifier(row.get("primaryidentifier").toString());
            gene.setSecondaryIdentifier(row.get("secondaryidentifier").toString());
            gene.setSymbol((String) row.get("symbol").toString());
            LocatedOn location = new LocatedOn();
            location.setChromosome(row.get("chprimaryidentifier").toString());
            location.setEnd((Long) row.get("end"));
            location.setStart((Long) row.get("start"));
            location.setStrand((Long) row.get("strand"));
            gene.setLocation(location);
            Gene overlappingGene = new Gene(row.get("oprimaryidentifier").toString());
            overlappingGene.setSymbol(row.get("osymbol").toString());
            LocatedOn locationOverlappingGene = new LocatedOn();
            locationOverlappingGene.setEnd((Long) row.get("oend"));
            locationOverlappingGene.setStart((Long) row.get("ostart"));
            locationOverlappingGene.setStrand((Long) row.get("ostrand"));
            overlappingGene.setLocation(locationOverlappingGene);
            gene.addOverlappingGene(overlappingGene);
        }
        while (result.hasNext()) {
            row = result.next();
            Gene overlappingGene = new Gene(row.get("oprimaryidentifier").toString());
            overlappingGene.setSymbol(row.get("osymbol").toString());
            LocatedOn locationOverlappingGene = new LocatedOn();
            locationOverlappingGene.setEnd((Long) row.get("oend"));
            locationOverlappingGene.setStart((Long) row.get("ostart"));
            locationOverlappingGene.setStrand((Long) row.get("ostrand"));
            overlappingGene.setLocation(locationOverlappingGene);
            gene.addOverlappingGene(overlappingGene);
        }
        return gene;
    }

    private LocatedOn getLocation(Node gene) {
        LocatedOn locatedOn = new LocatedOn();
        for (Relationship located : gene.getRelationships(IntermineRelationships.LOCATED_ON, Direction.OUTGOING)) {
            locatedOn.setStart((Long)located.getProperty("start"));
            locatedOn.setEnd((Long)located.getProperty("end"));
            locatedOn.setStrand((Long)located.getProperty("strand"));
            locatedOn.setChromosome((String)located.getEndNode().getProperty("primaryidentifier"));
            return locatedOn;
        }
        return null;
    }

    private String getQueryString() {
        return "MATCH (ch:Chromosome)<-[l1:LOCATED_ON]-(g:Gene {id: {id}})-[o:OVERLAPS]-(g2:Gene) -[l2:LOCATED_ON]->(ch:Chromosome) "
                + "return g.primaryidentifier as primaryidentifier, g.secondaryidentifier as secondaryidentifier, g.symbol as symbol, l1.start as start, l1.end as end, l1.strand as strand,"
                + "ch.primaryidentifier as chprimaryidentifier, g2.primaryidentifier as oprimaryidentifier, g2.symbol as osymbol, l2.start as ostart, l2.end as oend, l2.strand as ostrand ORDER BY g.primaryidentifier";
    }

    private String getGeneIdQueryString() {
        return "MATCH(g:Gene) WHERE g.primaryidentifier={lookup} return g.id as id "
                + "UNION MATCH(g:Gene) WHERE g.secondaryidentifier={lookup} return g.id as id "
                + "UNION MATCH(g:Gene) WHERE g.symbol={lookup} return g.id as id "
                + "UNION MATCH(g:Gene) WHERE g.name={lookup} return g.id as id";
    }
}
