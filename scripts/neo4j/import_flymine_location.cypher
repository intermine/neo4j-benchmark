//tfbindingsite
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/tfbindingsite.csv" AS row
CREATE (n:TFBindingSite:BindingSite:RegulatoryRegion:SequenceFeature:BioEntity) SET n = row;
CREATE INDEX ON :TFBindingSite(id);

//CRM
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/crm.csv" AS row
CREATE (n:CRM:RegulatoryRegion:SequenceFeature:BioEntity) SET n = row;
CREATE INDEX ON :CRM(id);

//Enhancer
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/enhancer.csv" AS row
CREATE (n:Enhancer:CRM:RegulatoryRegion:SequenceFeature:BioEntity) SET n = row;
CREATE INDEX ON :Enhancer(id);

//onlyregulatoryregion
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/onlyregulatoryregion.csv" AS row
CREATE (n:RegulatoryRegion:SequenceFeature:BioEntity) SET n = row;
CREATE INDEX ON :RegulatoryRegion(id);

//exon
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/exon.csv" AS row
CREATE (n:Exon:SequenceFeature:BioEntity) SET n = row;
CREATE INDEX ON :Exon(id);

//cds
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/cds.csv" AS row
CREATE (n:CDS:SequenceFeature:BioEntity) SET n = row;
CREATE INDEX ON :CDS(id);

//mirna
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/mirna.csv" AS row
CREATE (n:Mirna:Transcript) SET n = row;
CREATE INDEX ON :Mirna(id);

//only transcript
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/onlytranscript.csv" AS row
CREATE (n:Transcript) SET n = row;
CREATE INDEX ON :Transcript(id);

//onlyncrna
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/onlyncrna.csv" AS row
CREATE (n:NcRNA:Transcript:SequenceFeature:BioEntity) SET n = row;
CREATE INDEX ON :NcRNA(id);

//mrna
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/mrna.csv" AS row
CREATE (n:MRNA:Transcript:SequenceFeature:BioEntity) SET n = row;
CREATE INDEX ON :MRNA(id);

//snorna
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/snorna.csv" AS row
CREATE (n:SnoRNA:NcRNA:Transcript:SequenceFeature:BioEntity) SET n = row;
CREATE INDEX ON :SnoRNA(id);

//SnRNA
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/snrna.csv" AS row
CREATE (n:SnRNA:NcRNA:Transcript:SequenceFeature:BioEntity) SET n = row;
CREATE INDEX ON :SnRNA(id);

//trna
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/trna.csv" AS row
CREATE (n:TRNA:NcRNA:Transcript:SequenceFeature:BioEntity) SET n = row;
CREATE INDEX ON :TRNA(id);

//rrna
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/rrna.csv" AS row
CREATE (n:RRNA:NcRNA:Transcript:SequenceFeature:BioEntity) SET n = row;
CREATE INDEX ON :RRNA(id);

//threeprimeutr
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/threeprimeutr.csv" AS row
CREATE (n:ThreePrimeUTR:UTR:Transcript:SequenceFeature:BioEntity) SET n = row;
CREATE INDEX ON :ThreePrimeUTR(id);

//fiveprimeutr
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/fiveprimeutr.csv" AS row
CREATE (n:FivePrimeUTR:UTR:Transcript:SequenceFeature:BioEntity) SET n = row;
CREATE INDEX ON :FivePrimeUTR(id);

//Intron
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/intron.csv" AS row
CREATE (n:Intron:SequenceFeature:BioEntity) SET n = row;
CREATE INDEX ON :Intron(id);

//MiRNATarget
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/mirnatarget.csv" AS row
CREATE (n:MiRNATarget:SequenceFeature:BioEntity) SET n = row;
CREATE INDEX ON :MiRNATarget(id);

//pointmutation
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/pointmutation.csv" AS row
CREATE (n:PointMutation:SequenceFeature:BioEntity) SET n = row;
CREATE INDEX ON :PointMutation(id);

//TransposableElementInsertionSite
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/transposableelementinsertionsite.csv" AS row
CREATE (n:TransposableElementInsertionSite:SequenceFeature:BioEntity) SET n = row;
CREATE INDEX ON :TransposableElementInsertionSite(id);

//TransposableElement
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/onlytransposableelement.csv" AS row
CREATE (n:TransposableElement:SequenceFeature:BioEntity) SET n = row;
CREATE INDEX ON :TransposableElement(id);

//IntergenicRegion
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/intergenicregion.csv" AS row
CREATE (n:IntergenicRegion:SequenceFeature:BioEntity) SET n = row;
CREATE INDEX ON :IntergenicRegion(id);

//ChromosomeBand
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/chromosomeband.csv" AS row
CREATE (n:ChromosomeBand:SequenceFeature:BioEntity) SET n = row;
CREATE INDEX ON :ChromosomeBand(id);

//ChromosomeStructureVariation
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/onlychromosomestructurevariation.csv" AS row
CREATE (n:ChromosomeStructureVariation:SequenceFeature:BioEntity) SET n = row;
CREATE INDEX ON :ChromosomeStructureVariation(id);

//ChromosomalDeletion
USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:/chromosomaldeletion.csv" AS row
CREATE (n:ChromosomalDeletion:ChromosomeStructureVariation:SequenceFeature:BioEntity) SET n = row;
CREATE INDEX ON :ChromosomalDeletion(id);

CREATE INDEX ON :SequenceFeature(id);
CREATE INDEX ON :SequenceFeature(symbol);

