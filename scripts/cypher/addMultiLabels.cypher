match (n:protein) set n :bioentity;

match (n:gene) set n :sequencefeature;

match (n:goannotation) set n :ontologyannotation;

match (n:anatomyterm) set n :ontologyterm;
match (n:cvterm) set n :ontologyterm;
match (n:developmentterm) set n :ontologyterm;
match (n:goterm) set n :ontologyterm;
match (n:interactionterm) set n :ontologyterm;
match (n:mrnaexpressionterm) set n :ontologyterm;
match (n:soterm) set n :ontologyterm;

//transcrpit
match (n:mrna) set n :transcript;
match (n:mirna) set n :ncrna;
match (n:rrna) set n :ncrna;
match (n:snrna) set n :ncrna;
match (n:snorna) set n :ncrna;
match (n:trna) set n :ncrna;
match (n:ncrna) set n :transcript;
match (n:transcript) set n :sequencefeature;

//sequencefeature
match (n:bindingsite) set n :sequencefeature;
match (n:cdnaclone) set n :sequencefeature;
match (n:cds) set n :sequencefeature;
match (n:crm) set n :sequencefeature;
match (n:chromosome) set n :sequencefeature;
match (n:chromosomeband) set n :sequencefeature;
match (n:est) set n :sequencefeature;
match (n:enhancer) set n :sequencefeature;
match (n:exon) set n :sequencefeature;
match (n:fiveprimeutr) set n :sequencefeature;
match (n:forwardprimer) set n :sequencefeature;
match (n:goldenpathfragment) set n :sequencefeature;
match (n:intergenicregion) set n :sequencefeature;
match (n:intron) set n :sequencefeature;
//only flymine
//match (n:mirnatarget) set n :sequencefeature;
match (n:microarrayoligo) set n :sequencefeature;
match (n:naturaltransposableelement) set n :sequencefeature;
match (n:oligo) set n :sequencefeature;
match (n:overlappingestset) set n :sequencefeature;
match (n:pcrproduct) set n :sequencefeature;
match (n:pointmutation) set n :sequencefeature;
match (n:primer) set n :sequencefeature;
match (n:probeset) set n :sequencefeature;
match (n:regulatoryregion) set n :sequencefeature;
match (n:reverseprimer) set n :sequencefeature;
match (n:tfbindingsite) set n :sequencefeature;
match (n:threeprimeutr) set n :sequencefeature;
match (n:transposableelement) set n :sequencefeature;
match (n:transposableelementinsertionsite) set n :sequencefeature;
match (n:utr) set n :sequencefeature;

//chromosomestructurevariation and sequencecollection
match (sf:allele) set sf :sequencecollection;
match (sf:chromosomaldeletion) set sf :chromosomestructurevariation;
match (sf:chromosomalduplication) set sf :chromosomestructurevariation;
match (sf:chromosomalinversion) set sf :chromosomestructurevariation;
match (sf:chromosomaltranslocation) set sf :chromosomestructurevariation;
match (sf:chromosomaltransposition) set sf :chromosomestructurevariation;
match (sf:chromosomestructurevariation) set sf :sequencefeature;
match (sf:chromosomestructurevariation) set sf :sequencecollection;

match (sf:sequencecollection) set sf :bioentity;
match (sf:sequencefeature) set sf :bioentity;


