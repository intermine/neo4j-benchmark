#!/bin/bash
psql -d {databasename} -h {hostname} -U {username} -c "\d" | awk '{print $3}' > tables.txt

