//Create data relationships between Organism and Gene
MATCH (g:gene),(o:organism)
WHERE g.organismid = o.id
CREATE (g)-[:PART_OF]->(o);

//Create data relationships between DataSource and DataSet
MATCH (dsource:datasource),(dset:dataset)
WHERE dset.datasourceid = dsource.id
CREATE (dset)-[:FROM]->(dsource);

//Create data relationships betweeen Goterm and OntologyTerm
MATCH (a:goannotation),(t:goterm)
WHERE a.ontologytermid = t.id
CREATE (a)-[:USES]->(t);

//Create data relationships betweeen Gene and GoAnnotation
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/genegoannotation.csv" AS row
MATCH (g:gene),(go:goannotation)
WHERE g.id = row.gene AND go.id = row.goannotation
CREATE (g)-[:ANNOTATED_WITH]->(go);

//Create homologue relations between genes
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/homologue" AS row
MATCH (g1:gene {id: row.geneid}), (g2:gene {id: row.homologueid})

FOREACH(ignoreMe IN CASE WHEN row.type="paralogue" AND NOT((g2)-[:IS_PARALOGOUS]->(g1)) THEN [1] ELSE [] END | CREATE (g1)-[h:IS_PARALOGOUS {id: row.id, bootstrapscore: toInt(row.bootstrapscore), dataset: row.dataset}]->(g2))  
FOREACH(ignoreMe IN CASE WHEN row.type="orthologue" AND NOT((g2)-[:IS_ORTHOLOGOUS]->(g1)) THEN [1] ELSE [] END | CREATE (g1)-[h:IS_ORTHOLOGOUS {id: row.id, bootstrapscore: toInt(row.bootstrapscore), dataset: row.dataset}]->(g2))
FOREACH(ignoreMe IN CASE WHEN row.type="least diverged orthologue" AND NOT((g2)-[:IS_LEAST_DIVERGED_ORTHOLOGOUS]->(g1)) THEN [1] ELSE [] END | CREATE (g1)-[h:IS_LEAST_DIVERGED_ORTHOLOGOUS {id: row.id, bootstrapscore: toInt(row.bootstrapscore), dataset: row.dataset}]->(g2));

//Create located_on relations between sequence feature and chromosome
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/location" AS row
MATCH (sf:sequenceseature {id: row.featureid}), (ch:chromosome {id: row.locatedonid})
CREATE (sf)-[l:LOCATED_ON {id: row.id, start: toInt(row.intermine_start), end: toInt(row.intermine_end), strand: toInt(row.strand) }]->(ch);

//Create overlaps realtion
MATCH (sf1:gene)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:gene)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:gene)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:gene)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:gene)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:gene)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);






