# neo4j-benchmark
This repository contains:

Shell scripts to migrate data from postgres to neo4j:
* script/generateExportScript.sh:read from the file given in input(containing the list of tables to be imported in neo4j) and generate the export.sql script (to export data from postgres)
* script/generateImportScript.sh: generate the cypher/createNodes.cypher script to create nodes into neo4j
* to run the sql script use the psql option \i export.sql 
* to run the cypher scripts use the neo4j shell {neo4j dir}/bin/neo4j-shell -file createNodes.cypher

Some scripts used to benchmark with a subset of flymine data:
* script/sql/partial-flymine-export.sql: script to export part of flymine data into csv format files
* some cypher scripts to import csv files into neo4j
  * Before running the cypher scripts, copy *.csv under neo4j/import directory (or in neo4j.conf uncomment dbms.directories.import=import to load files from anywhere in filesystem)
  * run the cypher scripts in the following order: import_flymine.cypher, import_flymine_homologue.cypher, import_flymine_location.cypher, import_flymine_located_on_relationship.cypher, import_flymine_overlaps_relationship.cypher
  * to run the script: {neo4j home directory}/bin/neo4j-shell -file {path}/import_flymine.cypher
* a curl-format text file to use some nice curl options in order to calculate the execution time:
    * curl -w "@curl-format.txt" -s -i -X POST http://localhost:7474/db/data/transaction/commit -d '{"statements" : [ {"statement" : "MATCH(g:Gene) RETURN g"} ]}' -H "Accept:application/json; charset=UTF-8" -H "Content-Type:application/json" -o /dev/null

Neo4j server extensions implementing orthologue and overlapping queries using neo4j Java API
* after deploying on the server (read neo4j documentation)
  * curl -w "@curl-format.txt" -s -i http://localhost:7474/examples/orthologue/api/tws
  * curl -w "@curl-format.txt" -s -i http://localhost:7474/examples/overlapping/api/CG11566
