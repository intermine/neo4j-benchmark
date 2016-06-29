//Create OVERLAPS relationship between gene
MATCH (sf1:gene)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:gene)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:gene)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:gene)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:gene)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:gene)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

