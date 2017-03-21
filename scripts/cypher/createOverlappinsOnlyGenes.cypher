//Create OVERLAPS relationship ONLY between genes
MATCH (g1:gene)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(g2:gene)
WHERE (l2.end >= l1.start AND l2.start <= l1.end) AND NOT((g2)-[:OVERLAPS]->(g1))
MERGE(g1)-[o:OVERLAPS{chromosomeId:ch.id}]->(g2);

return 'created OVERLAPS for gene';
