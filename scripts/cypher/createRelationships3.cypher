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

//return 'created OVERLAPS for gene';

//Create OVERLAPS relationship between bindingsite
MATCH (sf1:bindingsite)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:bindingsite)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:bindingsite)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:bindingsite)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:bindingsite)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:bindingsite)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for bindingsite';

//Create OVERLAPS relationship between cdnaclone
MATCH (sf1:cdnaclone)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:cdnaclone)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:cdnaclone)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:cdnaclone)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:cdnaclone)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:cdnaclone)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for cdnaclone';

//Create OVERLAPS relationship between cds
MATCH (sf1:cds)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:cds)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:cds)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:cds)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:cds)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:cds)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for cds';

//Create OVERLAPS relationship between crm
MATCH (sf1:crm)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:crm)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:crm)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:crm)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:crm)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:crm)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for crm';

//Create OVERLAPS relationship between chromosome
MATCH (sf1:chromosome)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:chromosome)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:chromosome)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:chromosome)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:chromosome)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:chromosome)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for chromosome';

//Create OVERLAPS relationship between chromosomeband
MATCH (sf1:chromosomeband)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:chromosomeband)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:chromosomeband)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:chromosomeband)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:chromosomeband)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:chromosomeband)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for chromosomeband';

//Create OVERLAPS relationship between est
MATCH (sf1:est)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:est)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:est)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:est)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:est)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:est)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for est';

//Create OVERLAPS relationship between enhancer
MATCH (sf1:enhancer)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:enhancer)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:enhancer)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:enhancer)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:enhancer)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:enhancer)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for enhancer';

//Create OVERLAPS relationship between exon
MATCH (sf1:exon)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:exon)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:exon)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:exon)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:exon)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:exon)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for exon';

//Create OVERLAPS relationship between fiveprimeutr
MATCH (sf1:fiveprimeutr)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:fiveprimeutr)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:fiveprimeutr)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:fiveprimeutr)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:fiveprimeutr)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:fiveprimeutr)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for fiveprimeutr';

//Create OVERLAPS relationship between forwardprimer
MATCH (sf1:forwardprimer)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:forwardprimer)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:forwardprimer)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:forwardprimer)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:forwardprimer)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:forwardprimer)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for forwardprimer';

//Create OVERLAPS relationship between goldenpathfragment
MATCH (sf1:goldenpathfragment)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:goldenpathfragment)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:goldenpathfragment)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:goldenpathfragment)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:goldenpathfragment)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:goldenpathfragment)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for goldenpathfragment';

//Create OVERLAPS relationship between intergenicregion
MATCH (sf1:intergenicregion)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:intergenicregion)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:intergenicregion)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:intergenicregion)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:intergenicregion)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:intergenicregion)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for intergenicregion';

//Create OVERLAPS relationship between intron
MATCH (sf1:intron)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:intron)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:intron)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:intron)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:intron)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:intron)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for intron';

//Create OVERLAPS relationship between microarrayoligo
MATCH (sf1:microarrayoligo)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:microarrayoligo)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:microarrayoligo)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:microarrayoligo)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:microarrayoligo)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:microarrayoligo)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for microarrayoligo';

//Create OVERLAPS relationship between naturaltransposableelement
MATCH (sf1:naturaltransposableelement)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:naturaltransposableelement)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:naturaltransposableelement)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:naturaltransposableelement)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:naturaltransposableelement)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:naturaltransposableelement)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for naturaltransposableelement';

//Create OVERLAPS relationship between oligo
MATCH (sf1:oligo)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:oligo)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:oligo)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:oligo)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:oligo)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:oligo)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for oligo';

//Create OVERLAPS relationship between overlappingestset
MATCH (sf1:overlappingestset)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:overlappingestset)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:overlappingestset)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:overlappingestset)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:overlappingestset)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:overlappingestset)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for overlappingestset';

//Create OVERLAPS relationship between pcrproduct
MATCH (sf1:pcrproduct)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:pcrproduct)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:pcrproduct)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:pcrproduct)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:pcrproduct)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:pcrproduct)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for pcrproduct';

//Create OVERLAPS relationship between pointmutation
MATCH (sf1:pointmutation)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:pointmutation)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:pointmutation)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:pointmutation)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:pointmutation)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:pointmutation)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for pointmutation';

//Create OVERLAPS relationship between primer
MATCH (sf1:primer)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:primer)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:primer)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:primer)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:primer)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:primer)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for primer';

//Create OVERLAPS relationship between probeset
MATCH (sf1:probeset)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:probeset)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:probeset)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:probeset)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:probeset)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:probeset)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for probeset';

//Create OVERLAPS relationship between regulatoryregion
MATCH (sf1:regulatoryregion)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:regulatoryregion)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:regulatoryregion)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:regulatoryregion)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:regulatoryregion)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:regulatoryregion)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for regulatoryregion';

//Create OVERLAPS relationship between reverseprimer
MATCH (sf1:reverseprimer)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:reverseprimer)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:reverseprimer)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:reverseprimer)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:reverseprimer)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:reverseprimer)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for reverseprimer';

//Create OVERLAPS relationship between tfbindingsite
MATCH (sf1:tfbindingsite)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:tfbindingsite)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:tfbindingsite)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:tfbindingsite)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:tfbindingsite)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:tfbindingsite)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for tfbindingsite';

//Create OVERLAPS relationship between threeprimeutr
MATCH (sf1:threeprimeutr)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:threeprimeutr)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:threeprimeutr)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:threeprimeutr)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:threeprimeutr)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:threeprimeutr)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for threeprimeutr';

//Create OVERLAPS relationship between transposableelement
MATCH (sf1:transposableelement)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:transposableelement)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:transposableelement)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:transposableelement)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:transposableelement)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:transposableelement)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for transposableelement';

//Create OVERLAPS relationship between transposableelementinsertionsite
MATCH (sf1:transposableelementinsertionsite)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:transposableelementinsertionsite)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:transposableelementinsertionsite)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:transposableelementinsertionsite)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:transposableelementinsertionsite)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:transposableelementinsertionsite)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for transposableelementinsertionsite';

//Create OVERLAPS relationship between utr
MATCH (sf1:utr)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:utr)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:utr)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:utr)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:utr)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:utr)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for utr';

//Create OVERLAPS relationship between chromosomaldeletion
MATCH (sf1:chromosomaldeletion)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:chromosomaldeletion)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:chromosomaldeletion)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:chromosomaldeletion)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:chromosomaldeletion)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:chromosomaldeletion)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for chromosomaldeletion';

//Create OVERLAPS relationship between chromosomalduplication
MATCH (sf1:chromosomalduplication)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:chromosomalduplication)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:chromosomalduplication)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:chromosomalduplication)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:chromosomalduplication)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:chromosomalduplication)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for chromosomalduplication';

//Create OVERLAPS relationship between chromosomalinversion
MATCH (sf1:chromosomalinversion)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:chromosomalinversion)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:chromosomalinversion)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:chromosomalinversion)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:chromosomalinversion)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:chromosomalinversion)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for chromosomalinversion';

//Create OVERLAPS relationship between chromosomaltranslocation
MATCH (sf1:chromosomaltranslocation)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:chromosomaltranslocation)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:chromosomaltranslocation)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:chromosomaltranslocation)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:chromosomaltranslocation)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:chromosomaltranslocation)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for chromosomaltranslocation';

//Create OVERLAPS relationship between chromosomaltransposition
MATCH (sf1:chromosomaltransposition)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:chromosomaltransposition)
WHERE (l2.start<=l1.start AND l2.end >= l1.start AND l2.end <= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:chromosomaltransposition)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:chromosomaltransposition)
WHERE (l2.start<=l1.start AND l2.end >= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

MATCH (sf1:chromosomaltransposition)-[l1:LOCATED_ON]->(ch:chromosome)<-[l2:LOCATED_ON]-(sf2:chromosomaltransposition)
WHERE (l2.start>=l1.start AND l2.start<= l1.end) AND NOT((sf2)-[:OVERLAPS]->(sf1))
MERGE(sf1)-[o:OVERLAPS{chromosomeId:ch.id}]->(sf2);

return 'created OVERLAPS for chromosomaltransposition';
