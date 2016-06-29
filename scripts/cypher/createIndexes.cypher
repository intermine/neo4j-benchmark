#Create indexes on super classes 
CREATE INDEX ON :sequeancefeature(id);
CREATE INDEX ON :bioentity(id);
CREATE INDEX ON :ontologyterm(id);
CREATE INDEX ON :transcript(id);

#Create indexes used by benchmark queries
CREATE INDEX ON :gene(primaryidentifier);
CREATE INDEX ON :gene(secondaryidentifier);
CREATE INDEX ON :gene(symbol);
CREATE INDEX ON :organism(name);
CREATE INDEX ON :goterm(name);

#Create indexes used in the import step
CREATE INDEX ON :gene(organismid);
CREATE INDEX ON :dataset(datasourceid);
CREATE INDEX ON :goannotation(ontologytermid);
CREATE INDEX ON :goevidence(codeid);
CREATE INDEX ON :ontologyterm(ontologyid);


