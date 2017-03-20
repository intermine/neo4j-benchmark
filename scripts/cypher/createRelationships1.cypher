//Create PART_OF relationship between Organism and Gene
MATCH (g:gene),(o:organism)
WHERE g.organismid = o.id
CREATE (g)-[:PART_OF]->(o);

//Create FROM relationship between DataSource and DataSet
MATCH (dsource:datasource),(dset:dataset)
WHERE dset.datasourceid = dsource.id
CREATE (dset)-[:FROM]->(dsource);

//Create USES relationship betweeen GoAnnotation and GoTerm
MATCH (a:goannotation),(t:goterm)
WHERE a.ontologytermid = t.id
CREATE (a)-[:USES]->(t);

//Create ANNOTATED_WITH relationship betweeen Gene and GoAnnotation
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/Users/danielabutano/Projects/git/neo4j-benchmark/scripts/csv/genegoannotation.csv" AS row
MATCH (g:gene),(go:goannotation)
WHERE g.id = row.gene AND go.id = row.goannotation
CREATE (g)-[:ANNOTATED_WITH]->(go);

//Create EVIDENCED_BY relationship betweeen GoAnnotation and GoEvidence
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/Users/danielabutano/Projects/git/neo4j-benchmark/scripts/csv/evidencegoannotation.csv" AS row
MATCH (a:goannotation),(e:goevidence)
WHERE a.id = row.goannotation AND e.id = row.evidence
CREATE (a)-[:EVIDENCED_BY]->(e);

//Create HAS_CODE relationship betweeen GoEvidence and GoEvidenceCode
MATCH (evidence:goevidence),(code:goevidencecode)
WHERE evidence.codeid = code.id
CREATE (evidence)-[:HAS_CODE]->(code);

//Create CONTAINS relationship betweeen Ontology and OntologyTerm
MATCH (o:ontology),(term:ontologyterm)
WHERE o.id = term.ontologyid
CREATE (o)-[:CONTAINS]->(term);

//Create IS_SYNONYM relationship betweeen OntologyTerm and OntologyTermSynonym
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/Users/danielabutano/Projects/git/neo4j-benchmark/scripts/csv/ontologytermsynonyms.csv" AS row
MATCH (term:ontologyterm),(synonym:ontologytermsynonym)
WHERE term.id = row.ontologyterm AND synonym.id = row.synonyms
CREATE (synonym)-[:IS_SYNONYM]->(term);

//Create HAS_RELATION relationship betweeen OntologyTerm and OntologyTerm
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/Users/danielabutano/Projects/git/neo4j-benchmark/scripts/csv/ontologyrelation.csv" AS row
MATCH (t1:ontologyterm),(t2:ontologyterm)
WHERE t1.id = row.childtermid AND t2.id = row.parenttermid
CREATE (t1)-[:HAS_RELATION {relationship:row.relationship, redundant:row.redundant, direct: row.direct} ]->(t2);

//Create LOCATED_ON relationship between sequence feature and chromosome
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/Users/danielabutano/Projects/git/neo4j-benchmark/scripts/csv/location.csv" AS row
MATCH (sf:sequencefeature {id: row.featureid}), (ch:chromosome {id: row.locatedonid})
CREATE (sf)-[l:LOCATED_ON {id: row.id, start: toInt(row.intermine_start), end: toInt(row.intermine_end), strand: toInt(row.strand) }]->(ch);

//Create ENCODES relationship between gene and protein
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/Users/danielabutano/Projects/git/neo4j-benchmark/scripts/csv/genesproteins.csv" AS row
MATCH (g:gene),(p:protein)
WHERE g.id = row.genes AND p.id = row.proteins
CREATE (g)-[:ENCODES]->(p);

//Create BELONGS_TO relationship between protein and proteinfamily
//USING PERIODIC COMMIT
//LOAD CSV WITH HEADERS FROM "file:/TO_COMPLETE.csv" AS row
//MATCH (p:protein), (pf:proteinfamily)
//WHERE p.id = row.TO_COMPLETE AND pf.id = row.TO_COMPLETE
//CREATE (p)-[:BELONGS_TO]->(pf);

//Create HAS_MEMBER relationship between protein family and proteinfamilymember
//USING PERIODIC COMMIT
//LOAD CSV WITH HEADERS FROM "file:/TO_COMPLETE.csv" AS row
//MATCH (pf:proteinfamily), (pfm:proteinfamilymember)
//WHERE pf.id = row.TO_COMPLETE AND pfm.id = row.TO_COMPLETE
//CREATE (pf)-[:HAS_MEMBER]->(pfm);

