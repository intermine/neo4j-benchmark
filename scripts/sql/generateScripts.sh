#!/bin/bash
#read from table.txt file (containing the list of tables to be imported in neo4j)
#generate the export.sql script (to export data from postgres)
#generate the import.cypher script to import data into ne04j
#to run the cypher script use the neo4j shell {ne04j dir}/bin/neo4j-shell -file import.cypher
sqlscript="export.sql"
cyperscript="import.cypher"
if [ -f "$sqlscript" ]
then
    rm "$sqlscript"
fi
if [ -f "$cyperscript" ]
then
    rm "$cyperscript"
fi

if [ ! -d csv ]
then
mkdir csv
chmod 0777 csv
fi

while read tableName; do
  echo "\copy $tableName to '$(pwd)/csv/$tableName.csv' CSV HEADER DELIMITER ',';" >> "$sqlscript"
  echo "USING PERIODIC COMMIT LOAD CSV WITH HEADERS FROM \"$(pwd)/csv/$tableName.csv\" AS row CREATE (n:$tableName) SET n = row;" >> "$cyperscript"
done <tables.txt
