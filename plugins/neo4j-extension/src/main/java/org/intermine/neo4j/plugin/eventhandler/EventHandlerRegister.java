package org.intermine.neo4j.plugin.eventhandler;

import java.io.IOException;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.neo4j.graphdb.GraphDatabaseService;

@Path( "/eventhandler" )
public class EventHandlerRegister
{
    private GraphDatabaseService database;
    private OverlappingHandler overlappingHandler;
    public EventHandlerRegister(@Context GraphDatabaseService database)
    {
        this.database = database;
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/registeroverlapping")
    public Response registeroverlapping(@PathParam( "lookup" ) String lookup ) throws IOException {
        overlappingHandler = new OverlappingHandler(database);
        database.registerTransactionEventHandler(overlappingHandler);
        return Response.status(Response.Status.OK).entity("Overlapping Event Handlder registered").build();
    }
}
