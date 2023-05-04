#!/bin/bash

# INPUT_PATH="/home/user/geoserver/data/prodes/amz/mosaics_raster" # <- CHANGE ME
# OUTPUT_PATH="/home/user/geoserver/data/prodes/amz/temporal_mosaic" # <- CHANGE ME

INPUT_PATH="/home/adeline/Docker-Compose/geoserver/data/mosaics/amz/mosaics_raster" # <- CHANGE ME
OUTPUT_PATH="/home/adeline/Docker-Compose/geoserver/data/mosaics/amz/temporal_mosaic" # <- CHANGE ME

for DIR in `ls -d $INPUT_PATH/*/ | awk {'print $1'}`
do

    for DIR_IN in `ls -d $DIR* | awk {'print $1'}`
    do
	if [[ -d "$DIR_IN" ]];
        then

	  DEST_DIR=$(basename $DIR_IN)

          if [[ ! -d "$OUTPUT_PATH/$DEST_DIR" ]];
	  then
	        echo "Make directory named $OUTPUT_PATH/$DEST_DIR"
	        mkdir $OUTPUT_PATH/$DEST_DIR
	  fi
          echo "Copy from "$DIR_IN

          for n in $(seq 2000 2022) # <- CHANGE ME if one year (seq 2022 2022)
          do
            mv $DIR_IN/*$n*.tif $OUTPUT_PATH/$DEST_DIR
          done

        fi
    done
done
