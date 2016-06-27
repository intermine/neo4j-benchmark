#!/bin/bash
#generate the createNodes.cypher script to import nodes into ne04j
#to run the cypher script use the neo4j shell {ne04j dir}/bin/neo4j-shell -file createNodes.cypher
cyperscript="cypher/createNodes.cypher"
if [ -f "$cyperscript" ]
then
    rm "$cyperscript"
fi

while read tableName; do
  echo "USING PERIODIC COMMIT LOAD CSV WITH HEADERS FROM \"$(pwd)/csv/$tableName.csv\" AS row CREATE (n:$tableName) SET n = row;" >> "$cyperscript"
  echo "CREATE INDEX ON :$tableName(id);" >> "$cyperscript"
done <"$1"
