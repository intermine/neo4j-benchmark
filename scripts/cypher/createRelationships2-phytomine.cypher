//Create IS_HOMOLOGOUS relationship between genes
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "{complete path}/csv/homologue.csv" AS row
MATCH (g1:gene {id: row.gene1}), (g2:gene {id: row.gene2})

FOREACH(ignoreMe IN CASE WHEN NOT((g2)-[:IS_HOMOLOGOUS]->(g1)) THEN [1] ELSE [] END | CREATE (g1)-[h:IS_HOMOLOGOUS {id: row.id, bootstrapscore: toInt(row.bootstrapscore), method: row.method, groupname: row.groupname, relationship: row.relationship}]->(g2))  
