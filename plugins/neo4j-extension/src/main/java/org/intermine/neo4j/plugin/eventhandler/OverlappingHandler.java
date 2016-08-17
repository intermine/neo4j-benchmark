package org.intermine.neo4j.plugin.eventhandler;

import java.util.Iterator;

import org.intermine.neo4j.plugin.model.IntermineRelationships;
import org.neo4j.graphdb.GraphDatabaseService;
import org.neo4j.graphdb.Relationship;
import org.neo4j.graphdb.Transaction;
import org.neo4j.graphdb.event.TransactionData;
import org.neo4j.graphdb.event.TransactionEventHandler;

public class OverlappingHandler implements TransactionEventHandler {
    private final GraphDatabaseService database;

    public OverlappingHandler(GraphDatabaseService database) {
        this.database = database;
    }

    @Override
    public Object beforeCommit(TransactionData transactionData) throws Exception {
        return null;
    }
 
    @Override
    public void afterCommit(TransactionData transactionData, Object state) {
        try (Transaction tx = database.beginTx()) {
            Iterator<Relationship> it = transactionData.createdRelationships().iterator();
            Relationship lastRelationship = null;
            while (it.hasNext()) {
                lastRelationship = it.next();
            }
            if (lastRelationship != null) {
                if (!lastRelationship.isType(IntermineRelationships.OVERLAPS)) {
                    return;
                }
                //id of the last sequence feature processed to create OVERLAPS using sequencefeature.csv
                String lastSequenceFeatureId = (String) lastRelationship.getStartNode().getProperty("id");
                System.out.println("Last OVERLAPS relationship created for the sequencefeature with id: " + lastSequenceFeatureId);
            }
        }
    }
 
    @Override
    public void afterRollback(TransactionData transactionData, Object o) {
    }
}
