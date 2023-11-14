#!/bin/bash

echo "--------------------"
echo "/home/dnanexus/mongodb_setup.sh running..."
echo "--------------------"

# build app assets
echo "Building assets..."
# dx build_asset python-mongodb
pip install pymongo

# download samplot docker tar
echo "Downloading docker tar file..."
dx download project-G729Kkj4fq4Q9X1BPy0807bK:file-Gb924Y04fq4qPk6QpB1Yq6Vv

# load docker image
echo "Loading docker image..."
docker load -i mongo.tar

# download mongodb dump data
echo "Downloading mongodb dump data..."
mkdir mongo_data
dx download -r project-G729Kkj4fq4Q9X1BPy0807bK:/variants/mongodb/dump/active/ -o /home/dnanexus/mongo_data/

# start docker
echo "Starting mongo docker..."
docker run -p 27017:27017 --name mongodb -v /home/dnanexus/mongo_data:/home/dnanexus/mongo_data -d mongo

# create database from dump data
echo "Creating database from archived data..."
docker exec mongodb sh -c 'exec mongorestore /home/dnanexus/mongo_data/active/'

