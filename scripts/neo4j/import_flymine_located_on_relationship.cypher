//Create located_on relations between sequence feature and chromosome
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/location-part0" AS row
MATCH (sf:SequenceFeature {id: row.featureid}), (ch:Chromosome {id: row.locatedonid})
CREATE (sf)-[l:LOCATED_ON {id: row.id, start: toInt(row.intermine_start), end: toInt(row.intermine_end), strand: toInt(row.strand) }]->(ch);

//USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/location-part1" AS row
MATCH (sf:SequenceFeature {id: row.featureid}), (ch:Chromosome {id: row.locatedonid})
CREATE (sf)-[l:LOCATED_ON {id: row.id, start: toInt(row.intermine_start), end: toInt(row.intermine_end), strand: toInt(row.strand) }]->(ch);





