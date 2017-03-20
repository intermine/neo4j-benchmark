//Create OVERLAPS relationship between any sequence feature
USING PERIODIC COMMIT 5000
LOAD CSV WITH HEADERS FROM "file:/Users/danielabutano/Projects/git/neo4j-benchmark/scripts/csv/sequencefeature.csv" AS row
MATCH (sf1:sequencefeature)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:sequencefeature)
WHERE sf1.id = row.id AND (l2.end >= l1.start AND l2.start <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS]->(sf2);
