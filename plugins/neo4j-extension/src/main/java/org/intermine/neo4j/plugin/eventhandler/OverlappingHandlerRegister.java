package org.intermine.neo4j.plugin.eventhandler;

import org.neo4j.graphdb.GraphDatabaseService;
import org.neo4j.kernel.lifecycle.LifecycleAdapter;

public class OverlappingHandlerRegister extends LifecycleAdapter {
    private OverlappingHandler overlappingHandler = null;
    private GraphDatabaseService graphDatabaseService;

    public OverlappingHandlerRegister(GraphDatabaseService graphDatabaseService) {
        this.graphDatabaseService = graphDatabaseService;
    }

    @Override
    public void start() throws Throwable {
        overlappingHandler = new OverlappingHandler(graphDatabaseService);
        graphDatabaseService.registerTransactionEventHandler(overlappingHandler);
    }

    @Override
    public void stop() throws Throwable {
        graphDatabaseService.unregisterTransactionEventHandler(overlappingHandler);
}
}
