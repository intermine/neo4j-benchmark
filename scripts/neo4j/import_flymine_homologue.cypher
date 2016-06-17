//Create homologue relations between genes
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/homologue-part0" AS row
MATCH (g1:Gene {id: row.geneid}), (g2:Gene {id: row.homologueid})

FOREACH(ignoreMe IN CASE WHEN row.type="paralogue" AND NOT((g2)-[:IS_PARALOGOUS]->(g1)) THEN [1] ELSE [] END | CREATE (g1)-[h:IS_PARALOGOUS {id: row.id, bootstrapscore: toInt(row.bootstrapscore), dataset: row.dataset}]->(g2))  
FOREACH(ignoreMe IN CASE WHEN row.type="orthologue" AND NOT((g2)-[:IS_ORTHOLOGOUS]->(g1)) THEN [1] ELSE [] END | CREATE (g1)-[h:IS_ORTHOLOGOUS {id: row.id, bootstrapscore: toInt(row.bootstrapscore), dataset: row.dataset}]->(g2))
FOREACH(ignoreMe IN CASE WHEN row.type="least diverged orthologue" AND NOT((g2)-[:IS_LEAST_DIVERGED_ORTHOLOGOUS]->(g1)) THEN [1] ELSE [] END | CREATE (g1)-[h:IS_LEAST_DIVERGED_ORTHOLOGOUS {id: row.id, bootstrapscore: toInt(row.bootstrapscore), dataset: row.dataset}]->(g2));

//Create homologue relations between genes
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/homologue-part1" AS row
MATCH (g1:Gene {id: row.geneid}), (g2:Gene {id: row.homologueid})

FOREACH(ignoreMe IN CASE WHEN row.type="paralogue" AND NOT((g2)-[:IS_PARALOGOUS]->(g1)) THEN [1] ELSE [] END | CREATE (g1)-[h:IS_PARALOGOUS {id: row.id, bootstrapscore: toInt(row.bootstrapscore), dataset: row.dataset}]->(g2))  
FOREACH(ignoreMe IN CASE WHEN row.type="orthologue" AND NOT((g2)-[:IS_ORTHOLOGOUS]->(g1)) THEN [1] ELSE [] END | CREATE (g1)-[h:IS_ORTHOLOGOUS {id: row.id, bootstrapscore: toInt(row.bootstrapscore), dataset: row.dataset}]->(g2))
FOREACH(ignoreMe IN CASE WHEN row.type="least diverged orthologue" AND NOT((g2)-[:IS_LEAST_DIVERGED_ORTHOLOGOUS]->(g1)) THEN [1] ELSE [] END | CREATE (g1)-[h:IS_LEAST_DIVERGED_ORTHOLOGOUS {id: row.id, bootstrapscore: toInt(row.bootstrapscore), dataset: row.dataset}]->(g2));

//Create homologue relations between genes
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/homologue-part2" AS row
MATCH (g1:Gene {id: row.geneid}), (g2:Gene {id: row.homologueid})

FOREACH(ignoreMe IN CASE WHEN row.type="paralogue" AND NOT((g2)-[:IS_PARALOGOUS]->(g1)) THEN [1] ELSE [] END | CREATE (g1)-[h:IS_PARALOGOUS {id: row.id, bootstrapscore: toInt(row.bootstrapscore), dataset: row.dataset}]->(g2))  
FOREACH(ignoreMe IN CASE WHEN row.type="orthologue" AND NOT((g2)-[:IS_ORTHOLOGOUS]->(g1)) THEN [1] ELSE [] END | CREATE (g1)-[h:IS_ORTHOLOGOUS {id: row.id, bootstrapscore: toInt(row.bootstrapscore), dataset: row.dataset}]->(g2))
FOREACH(ignoreMe IN CASE WHEN row.type="least diverged orthologue" AND NOT((g2)-[:IS_LEAST_DIVERGED_ORTHOLOGOUS]->(g1)) THEN [1] ELSE [] END | CREATE (g1)-[h:IS_LEAST_DIVERGED_ORTHOLOGOUS {id: row.id, bootstrapscore: toInt(row.bootstrapscore), dataset: row.dataset}]->(g2));

//Create homologue relations between genes
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/homologue-part3" AS row
MATCH (g1:Gene {id: row.geneid}), (g2:Gene {id: row.homologueid})

FOREACH(ignoreMe IN CASE WHEN row.type="paralogue" AND NOT((g2)-[:IS_PARALOGOUS]->(g1)) THEN [1] ELSE [] END | CREATE (g1)-[h:IS_PARALOGOUS {id: row.id, bootstrapscore: toInt(row.bootstrapscore), dataset: row.dataset}]->(g2))  
FOREACH(ignoreMe IN CASE WHEN row.type="orthologue" AND NOT((g2)-[:IS_ORTHOLOGOUS]->(g1)) THEN [1] ELSE [] END | CREATE (g1)-[h:IS_ORTHOLOGOUS {id: row.id, bootstrapscore: toInt(row.bootstrapscore), dataset: row.dataset}]->(g2))
FOREACH(ignoreMe IN CASE WHEN row.type="least diverged orthologue" AND NOT((g2)-[:IS_LEAST_DIVERGED_ORTHOLOGOUS]->(g1)) THEN [1] ELSE [] END | CREATE (g1)-[h:IS_LEAST_DIVERGED_ORTHOLOGOUS {id: row.id, bootstrapscore: toInt(row.bootstrapscore), dataset: row.dataset}]->(g2));




