package org.intermine.neo4j.plugin.model;

import org.neo4j.graphdb.RelationshipType;

public enum IntermineRelationships implements RelationshipType {
    LOCATED_ON, OVERLAPS, IS_ORTHOLOGOUS, PART_OF, ANNOTATED_WITH, USES;
}
