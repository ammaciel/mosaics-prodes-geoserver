#!/bin/bash

#INPUT_DIR="/home/user/geoserver/data/prodes/amz/temporal_mosaic"
INPUT_DIR="/home/adeline/Docker-Compose/geoserver/data/mosaics/amz/temporal_mosaic"
INPUT_PROPERTIES=`ls $INPUT_DIR/*.properties`

echo
echo "Files datastore.properties, timeregex.properties and indexer.properties:"
echo
echo $INPUT_PROPERTIES
echo

for path in $INPUT_DIR/*/
do
    echo  $path
    cp $INPUT_PROPERTIES $path

done

