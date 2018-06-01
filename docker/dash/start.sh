#!/bin/bash

#     - INGEST_NAME=<%= mount['name'] %>
#     - INGEST_PROCESSED=<%= mount['processed'] ? 1 : 0 %>

#     - DASH_BITRATE=128,256
#     - DASH_SEGLENGTH=1000

echo "" > /dashcast.conf

ARGS=""

for i in $(echo $DASH_BITRATE | sed "s/,/ /g"); do

	ARGS="${ARGS} -f flv -c:a libfdk_aac -profile:a aac_he_v2 -b:a ${i}k -bufsize ${i}k rtmp://rtmp:1935/publish/${INGEST_NAME}_${i}"

done

cat /dashcast.conf

if [ "$INGEST_PROCESSED" == "1" ]; then
	URI="http://icecast:8000/internal/master/${INGEST_NAME}_processed.flac"
else
	URI="http://icecast:8000/internal/master/${INGEST_NAME}.flac"
fi


while [ true ]; do

	/opt/ffmpeg/bin/ffmpeg -i "${URI}" $ARGS

	sleep 0.1
done

