package org.intermine.neo4j.plugin;

import org.neo4j.graphdb.Label;

public enum IntermineLabel implements Label {
    bioentity, sequencefeature, gene, chromosome, dataset;
}
