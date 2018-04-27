#!/bin/bash

#     - INGEST_NAME=<%= mount['name'] %>
#     - INGEST_PROCESSED=<%= mount['processed'] ? 1 : 0 %>

#     - DASH_BITRATE=128,256
#     - DASH_SEGLENGTH=1000

echo "" > /dashcast.conf

for i in $(echo $DASH_BITRATE | sed "s/,/ /g"); do

	echo "[a${i}]" >> /dashcast.conf
	echo "type=audio" >> /dashcast.conf
	echo "bitrate=${i}000" >> /dashcast.conf

done

cat /dashcast.conf

if [ "$INGEST_PROCESSED" == "1" ]; then
	URI="http://icecast:8000/internal/master/${INGEST_NAME}_processed.flac"
else
	URI="http://icecast:8000/internal/master/${INGEST_NAME}.flac"
fi

while [ true ]; do

	/usr/bin/DashCast -a "http://stream.cor.insanityradio.com/insanity320.mp3" -live -conf /dashcast.conf -out /srv/dash -seg-dur ${DASH_SEGLENGTH} -frag-dur ${DASH_SEGLENGTH} -mpd ${INGEST_NAME}.mpd

	sleep 0.1
done

