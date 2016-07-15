package org.intermine.neo4j.plugin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.neo4j.graphdb.Direction;
import org.neo4j.graphdb.GraphDatabaseService;
import org.neo4j.graphdb.Node;
import org.neo4j.graphdb.NotFoundException;
import org.neo4j.graphdb.Relationship;
import org.neo4j.graphdb.Transaction;
import org.neo4j.logging.Log;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Path( "/orthologue" )
public class Orthologue
{
    private final GraphDatabaseService database;
    private Map<String, String> dsNameCache = new HashMap<String , String>();
    @Context public Log log;

    public Orthologue(@Context GraphDatabaseService database )
    {
        this.database = database;
    }

    @GET
    @Produces( MediaType.APPLICATION_JSON )
    @Path( "/api/{lookup}" )
    public Response orthologue(@PathParam( "lookup" ) String lookup ) throws IOException {
        return orthologue(lookup, BenchmarkMode.API);
    }

    public Response orthologue(String lookup, BenchmarkMode mode) throws IOException {
        long start = System.currentTimeMillis();
        Gene gene = getLookupGene(lookup);
        if (gene == null) {
            return Response.status(Response.Status.NOT_FOUND).entity("Gene not found").build();
        }
        long time = System.currentTimeMillis() - start;
        log.info("execution time for " + time);
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String json = gson.toJson(gene);
        return Response.ok(json, MediaType.APPLICATION_JSON).build();
    }

    private Gene getLookupGene(String lookup) {
        Transaction transaction = null;
        Gene gene = null;
        try {
            transaction = database.beginTx();
            Node geneNode = lookupGeneNode(lookup);
            if (geneNode != null) {
                gene = getGene(geneNode);
            }
            transaction.success();
        } finally {
            transaction.close();
        }
        return gene;
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

    private Node findDataSetById(String id) {
        return database.findNode(IntermineLabel.dataset, "id", id);
    }

    private String getDataSetName(String id) {
        if (id == null) {
            return null;
        }
        if (dsNameCache.containsKey(id)) {
            return (String) dsNameCache.get(id);
        }
        Node dataSetNode = findDataSetById(id);
        if (dataSetNode == null) {
            return null;
        }
        String dsName = (String) dataSetNode.getProperty("name");
        dsNameCache.put(id, dsName);
        return dsName;
    }

    private Gene getGene(Node node) {
        Gene gene = new Gene();
        gene.setPrimaryIdentifier((String) node.getProperty("primaryidentifier"));
        gene.setSecondaryIdentifier((String) node.getProperty("secondaryidentifier"));
        gene.setSymbol((String) node.getProperty("symbol"));
        for (Relationship orthologue : node.getRelationships(IntermineRelationships.IS_ORTHOLOGOUS, Direction.BOTH)) {
            String dataSet = getDataSetName((String)orthologue.getProperty("dataset"));
            Node orthologueGeneNode = (orthologue.getStartNode().getId() != node.getId()) ? orthologue.getStartNode() : orthologue.getEndNode();
            Gene orthologueGene = new Gene((String) orthologueGeneNode.getProperty("primaryidentifier"));
            try {
                orthologueGene.setSymbol((String)orthologueGeneNode.getProperty("symbol"));
            } catch (NotFoundException nfe) {
            }
            orthologueGene.setOrganism(getOrganism(orthologueGeneNode));
            orthologueGene.setGoTermIdentifiers(getGoTermNames(orthologueGeneNode));
            gene.addOrthologue(dataSet, orthologueGene);
        }
        return gene;
    }

    private Organism getOrganism(Node gene) {
        Organism organism = new Organism();
        for (Relationship partOf : gene.getRelationships(IntermineRelationships.PART_OF, Direction.OUTGOING)) {
            Node organismNode = partOf.getEndNode();
            organism.setName((String) organismNode.getProperty("name"));
            return organism;
        }
        return null;
    }

    private List<String> getGoTermNames(Node gene) {
        List<String> goTermIdentifiers = new ArrayList<>();
        Node goAnnotation = null;
        Node goTerm = null;
        for (Relationship annotated_with : gene.getRelationships(IntermineRelationships.ANNOTATED_WITH, Direction.OUTGOING)) {
            goAnnotation = annotated_with.getEndNode();
            if (goAnnotation != null) {
                goTerm = goAnnotation.getSingleRelationship(IntermineRelationships.USES, Direction.OUTGOING).getEndNode();
                if (goTerm != null) {
                    goTermIdentifiers.add((String)goTerm.getProperty("identifier"));
                }
            }
        }
        return goTermIdentifiers;
    }
}
