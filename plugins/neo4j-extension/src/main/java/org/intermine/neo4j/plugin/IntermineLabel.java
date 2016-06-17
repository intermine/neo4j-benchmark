package org.intermine.neo4j.plugin;

import org.neo4j.graphdb.Label;

public enum IntermineLabel implements Label {
    BioEntity, SequenceFeature, Gene, Chromosome, DataSet;
}
