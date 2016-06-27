#!/bin/bash
#read from the file given in input(containing the list of tables to be imported in neo4j)
#and generate the export.sql script (to export data from postgres)
sqlscript="sql/export.sql"
if [ -f "$sqlscript" ]
then
    rm "$sqlscript"
fi

if [ ! -d csv ]
then
mkdir csv
chmod 0777 csv
fi

while read tableName; do
  echo "\copy $tableName to '$(pwd)/csv/$tableName.csv' CSV HEADER DELIMITER ',';" >> "$sqlscript"
done <"$1"
