#!/bin/sh

# if database doesn't already exist, download it
# and configure
cd /data

if [ ! -f "./panama-papers-mac-2016-05-17.tar.gz" ]; then
  echo "Downloading data"
  wget "https://cloudfront-files-1.publicintegrity.org/offshoreleaks/neo4j/panama-papers-mac-2016-05-17.tar.gz"
else 
  echo "Not downloading data as file already exists"
fi

if [ ! -d "./panama-papers" ]; then
  tar -zxvf panama-papers-mac-2016-05-17.tar.gz
fi

if [ ! -d "/data/databases/panama.graphdb" ]; then
  echo "Copying data over to databases directory"
  cp -R ./panama-papers/ICIJ\ Panama\ Papers/panama_data_for_neo4j/databases /data/
else
  echo "Skipping copying data over to databases directory as panama.graphdb already exists"
fi

echo "Copying config and plugins"
cp -R ./panama-papers/ICIJ\ Panama\ Papers/panama_data_for_neo4j/conf/* /var/lib/neo4j/conf/
mkdir /var/plugins
cp -R ./panama-papers/ICIJ\ Panama\ Papers/panama_data_for_neo4j/plugins/* /var/plugins/
