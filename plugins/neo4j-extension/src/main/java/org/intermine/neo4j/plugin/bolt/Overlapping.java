package org.intermine.neo4j.plugin.bolt;

import org.intermine.neo4j.plugin.model.Gene;
import org.intermine.neo4j.plugin.model.LocatedOn;
//import org.neo4j.driver.v1.Driver;
//import org.neo4j.driver.v1.GraphDatabase;
//import org.neo4j.driver.v1.Record;
//import org.neo4j.driver.v1.Session;
//import org.neo4j.driver.v1.StatementResult;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class Overlapping {
    
    public static void main(String[] args) {
/*        Driver driver = GraphDatabase.driver( "bolt://localhost:7687");
        Session session = driver.session();
        long start = System.currentTimeMillis();
        StatementResult result = session.run(getQueryString());
        Gene gene = getGene(result);
        System.out.println("Execution time " + (System.currentTimeMillis() - start) + "ms");
        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        System.out.println(gson.toJson(gene));
        session.close();
        driver.close();*/
    }

    private static String getQueryString() {
        return "MATCH (ch:Chromosome)<-[l1:LOCATED_ON]-(g:Gene {symbol:'CG11566'})-[o:OVERLAPS]-(g2:Gene) -[l2:LOCATED_ON]->(ch:Chromosome) "
                + "return g.primaryidentifier as primaryidentifier, g.secondaryidentifier as secondaryidentifier, g.symbol as symbol, l1.start as start, l1.end as end, l1.strand as strand,"
                + "ch.primaryidentifier as chprimaryidentifier, g2.primaryidentifier as oprimaryidentifier, g2.symbol as osymbol, l2.start as ostart, l2.end as oend, l2.strand as ostrand ORDER BY g.primaryidentifier";
    }

/*    private static Gene getGene(final StatementResult result) {
        Gene gene = new Gene();
        Record record = result.next();
        if (record != null) {
            gene.setPrimaryIdentifier(record.get("primaryidentifier").asString());
            gene.setSecondaryIdentifier(record.get("secondaryidentifier").asString());
            gene.setSymbol((String) record.get("symbol").asString());
            LocatedOn location = new LocatedOn();
            location.setChromosome(record.get("chprimaryidentifier").asString());
            location.setEnd(record.get("end").asLong());
            location.setStart(record.get("start").asLong());
            location.setStrand(record.get("strand").asLong());
            gene.setLocation(location);
            Gene overlappingGene = new Gene(record.get("oprimaryidentifier").asString());
            overlappingGene.setSymbol(record.get("osymbol").asString());
            LocatedOn locationOverlappingGene = new LocatedOn();
            locationOverlappingGene.setEnd(record.get("oend").asLong());
            locationOverlappingGene.setStart(record.get("ostart").asLong());
            locationOverlappingGene.setStrand(record.get("ostrand").asLong());
            overlappingGene.setLocation(locationOverlappingGene);
            gene.addOverlappingGene(overlappingGene);
        }
        while (result.hasNext()) {
            record = result.next();
            Gene overlappingGene = new Gene(record.get("oprimaryidentifier").asString());
            overlappingGene.setSymbol(record.get("osymbol").asString());
            LocatedOn locationOverlappingGene = new LocatedOn();
            locationOverlappingGene.setEnd(record.get("oend").asLong());
            locationOverlappingGene.setStart(record.get("ostart").asLong());
            locationOverlappingGene.setStrand(record.get("ostrand").asLong());
            overlappingGene.setLocation(locationOverlappingGene);
            gene.addOverlappingGene(overlappingGene);
        }
        return gene;
    }*/
}
