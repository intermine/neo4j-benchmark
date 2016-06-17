//Organism
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/organism.csv" AS row
CREATE (n:Organism) SET n = row;

CREATE INDEX ON :Organism(id);
CREATE INDEX ON :Organism(name);

//Gene
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/gene.csv" AS row
CREATE (n:Gene:SequenceFeature:BioEntity) SET n = row, n.score = toFloat(row.score);

CREATE INDEX ON :Gene(id);
CREATE INDEX ON :Gene(primaryidentifier);
CREATE INDEX ON :Gene(secondaryidentifier);
CREATE INDEX ON :SequeanceFeature(id);
CREATE INDEX ON :SequeanceFeature(primaryidentifier);
CREATE INDEX ON :SequeanceFeature(secondaryidentifier);
CREATE INDEX ON :BioEntity(id);
CREATE INDEX ON :BioEntity(primaryidentifier);
CREATE INDEX ON :BioEntity(secondaryidentifier);

//Create data relationships between Organism and Gene
MATCH (g:Gene),(o:Organism)
WHERE g.organismid = o.id
CREATE (g)-[:PART_OF]->(o);

//GoAnnotation
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/goannotation.csv" AS row
CREATE (go:GoAnnotation:OntologyAnnotation) SET go = row;

CREATE INDEX ON :GoAnnotation(id);
CREATE INDEX ON :OntologyAnnotation(id);

//GoTerm
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/goterm.csv" AS row
CREATE (got:GOTerm:OntologyTerm) SET got = row,
got.obsolete = CASE row.obsolete WHEN 'f' THEN false ELSE true END;

//Create data relationships betweeen Goterm and OntologyTerm
MATCH (a:GoAnnotation),(t:GOTerm)
WHERE a.ontologytermid = t.id
CREATE (a)-[:USES]->(t);

//Create data relationships betweeen Gene and GoAnnotation
//USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/genegoannotation.csv" AS row
MATCH (g:Gene),(go:GoAnnotation)
WHERE g.id = row.gene AND go.id = row.goannotation
CREATE (g)-[:ANNOTATED_WITH]->(go);

//DataSource
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/datasource.csv" AS row
CREATE (n:DataSource) SET n = row;

CREATE INDEX ON :DataSource(id);

//DataSet
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/dataset.csv" AS row
CREATE (n:DataSet) SET n = row;

CREATE INDEX ON :DataSet(id);

//Create data relationships between DataSource and DataSet
MATCH (datasource:DataSource),(dataset:DataSet)
WHERE dataset.datasourceid = datasource.id
CREATE (dataset)-[:FROM]->(datasource);

//Chromosome
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/chromosome.csv" AS row
CREATE (n:Chromosome:SequenceFeature:BioEntity) SET n = row;

CREATE INDEX ON :Chromosome(id);
