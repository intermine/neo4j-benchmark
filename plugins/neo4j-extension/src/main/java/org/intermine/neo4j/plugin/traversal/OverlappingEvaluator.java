package org.intermine.neo4j.plugin.traversal;

import org.intermine.neo4j.plugin.model.IntermineLabel;
import org.neo4j.graphdb.Node;
import org.neo4j.graphdb.Path;
import org.neo4j.graphdb.Relationship;
import org.neo4j.graphdb.traversal.Evaluation;
import org.neo4j.graphdb.traversal.Evaluator;

public class OverlappingEvaluator implements Evaluator {
    private long start;
    private long end;

    public OverlappingEvaluator(long start, long end) {
        super();
        this.start = start;
        this.end = end;
    }

    @Override
    public Evaluation evaluate(Path path) {
        if (path.length() < 2) {
            return Evaluation.EXCLUDE_AND_CONTINUE;
        }
 
        Node lastNode = path.endNode();
        if (!lastNode.hasLabel(IntermineLabel.gene)){
            return Evaluation.EXCLUDE_AND_PRUNE;
        }

        Relationship locatedOn = path.lastRelationship();
        if (((Long)locatedOn.getProperty("end")) >= start && ((Long)locatedOn.getProperty("start")) <= end) {
            return Evaluation.INCLUDE_AND_PRUNE;
        }
        return Evaluation.EXCLUDE_AND_PRUNE;
    }
}
