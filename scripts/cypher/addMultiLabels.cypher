match (n:protein)
set n :bioentity
return n;

match (n:gene)
set n :bioentity:sequencefeature
return n;

match (n:goannotation)
set n :ontologyannotation
return n;

#ONTOLOGYTERM
match (n:anatomyterm)
set n :ontologyterm
return n;

match (n:cvterm)
set n :ontologyterm
return n;

match (n:developmentterm)
set n :ontologyterm
return n;

match (n:goterm)
set n :ontologyterm
return n;

match (n:interactionterm)
set n :ontologyterm
return n;

match (n:mrnaexpressionterm)
set n :ontologyterm
return n;

match (n:soterm)
set n :ontologyterm
return n;

#TRANSCRIPT
match (n:mrna)
set n :transcript
return n;

match (n:mirna)
set n :transcript
return n;

match (n:ncrna)
set n :transcript
return n;

match (n:rrna)
set n :transcript
return n;

match (n:snrna)
set n :transcript
return n;

match (n:snorna)
set n :transcript
return n;

match (n:trna)
set n :transcript
return n;

#SEQUENCEFEATURE
match (n:cdnaclone)
set n :sequencefeature
return n;

match (n:cds)
set n :sequencefeature
return n;

match (n:crm)
set n :sequencefeature
return n;

match (n:chromosomaldeletion)
set n :sequencefeature
return n;

match (n:chromosomalduplication)
set n :sequencefeature
return n;

match (n:chromosomalinversion)
set n :sequencefeature
return n;

match (n:chromosomaltranslocation)
set n :sequencefeature
return n;

match (n:chromosomaltransposition)
set n :sequencefeature
return n;

match (n:chromosome)
set n :sequencefeature
return n;

match (n:chromosomeband)
set n :sequencefeature
return n;

match (n:chromosomestructurevariation)
set n :sequencefeature
return n;

match (n:est)
set n :sequencefeature
return n;

match (n:enhancer)
set n :sequencefeature
return n;

match (n:exon)
set n :sequencefeature
return n;

match (n:fiveprimeutr)
set n :sequencefeature
return n;

match (n:intergenicregion)
set n :sequencefeature
return n;

match (n:intron)
set n :sequencefeature
return n;

match (n:mirnatarget)
set n :sequencefeature
return n;

match (n:microarrayoligo)
set n :sequencefeature
return n;

match (n:naturaltransposableelement)
set n :sequencefeature
return n;

match (n:pointmutation)
set n :sequencefeature
return n;

match (n:probeset)
set n :sequencefeature
return n;

match (n:regulatoryregion)
set n :sequencefeature
return n;

match (n:tfbindingsite)
set n :sequencefeature
return n;

match (n:threeprimeutr)
set n :sequencefeature
return n;

 org.intermine.model.bio.Transcript
match (n:transcript)
set n :sequencefeature
return n;

match (n:transposableelement)
set n :sequencefeature
return n;

match (n:transposableelementinsertionsite)
set n :sequencefeature
return n;










