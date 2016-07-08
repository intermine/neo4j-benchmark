//Create OVERLAPS relationship between any sequence feature
MATCH (sf1:sequencefeature)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:sequencefeature)
WHERE (l2.end >= l1.start AND l2.start <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for sequencefeature';
