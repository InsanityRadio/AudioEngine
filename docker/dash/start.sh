#!/bin/bash

#     - INGEST_NAME=<%= mount['name'] %>
#     - INGEST_PROCESSED=<%= mount['processed'] ? 1 : 0 %>

#     - DASH_BITRATE=128,256
#     - DASH_SEGLENGTH=1000

echo "" > /dashcast.conf

MAPS=""
ARGS=""
PROG=""

ITER=0
for i in $(echo $DASH_BITRATE | sed "s/,/ /g"); do

	profile="aac_lc"

	if echo $DASH_BITRATE | grep ':'; then
		profile=`echo $DASH_BITRATE | cut -f':' -f2`
	fi

	MAPS="${MAPS} -map 0:0"
	ARGS="${ARGS} -c:a:$ITER libfdk_aac -profile:a:$ITER $profile -b:a:$ITER ${i}k"
	PROG="${PROG} -program st=$ITER:title=${i}"

	ITER=$(expr $ITER + 1)

done

cat /dashcast.conf

if [ "$INGEST_PROCESSED" == "1" ]; then
	URI="http://icecast:8000/internal/master/${INGEST_NAME}_processed.flac"
else
	URI="http://icecast:8000/internal/master/${INGEST_NAME}.flac"
fi


while [ true ]; do

	/opt/ffmpeg/bin/ffmpeg -i "${URI}" $MAPS $ARGS $PROG -f mpegts http://rtmp:80/publish/${INGEST_NAME}

	sleep 0.1
done

