#!/bin/bash

echo "--------------------"
echo "/home/dnanexus/mongodb_shutdown.sh running..."
echo "--------------------"

thedate=$(date '+%Y%m%d%H%M%S')

# archive previous data and dump the variant database to the mounted drive
echo "Archive current data and exporting new session data from mongo database..."
dx mv project-G729Kkj4fq4Q9X1BPy0807bK:/variants/mongodb/dump/active/variant_db/ project-G729Kkj4fq4Q9X1BPy0807bK:/variants/mongodb/dump/archive/variant_db_${thedate}
docker exec mongodb sh -c 'exec mongodump -d variant_db -o /home/dnanexus/mongo_data/dump'

# upload the dump dir to resources:/variants/mongodb/
echo "Uploading mongo database data to project-G729Kkj4fq4Q9X1BPy0807bK:/variants/mongodb/dump/active/ --tag $thedate"
dx upload /home/dnanexus/mongo_data/dump/variant_db -r --path project-G729Kkj4fq4Q9X1BPy0807bK:/variants/mongodb/dump/active/ --tag $thedate