package org.intermine.neo4j.plugin.eventhandler;

import org.neo4j.graphdb.GraphDatabaseService;
import org.neo4j.kernel.extension.KernelExtensionFactory;
import org.neo4j.kernel.impl.spi.KernelContext;
import org.neo4j.kernel.lifecycle.Lifecycle;

public class OverlappingKernelExtensionFactory extends KernelExtensionFactory<OverlappingKernelExtensionFactory.Dependencies> {

    public interface Dependencies
    {
        GraphDatabaseService getGraphDatabaseService();
    }

    public OverlappingKernelExtensionFactory() {
        super("overlapping");
    }

    @Override
    public Lifecycle newInstance(KernelContext context, Dependencies dependecies) throws Throwable {
        return new OverlappingHandlerRegister(dependecies.getGraphDatabaseService());
    }

}
