#!/bin/bash

#     - INGEST_NAME=<%= mount['name'] %>
#     - INGEST_CODEC=<%= mount['codec'] %>
#     - INGEST_PROCESSED=<%= mount['processed'] ? 1 : 0 %>
#     - INGEST_BITRATE=<%= mount['bitrate'] %>

if [ "$INGEST_PROCESSED" == "1" ]; then
	URI="http://icecast:8000/internal/master/${INGEST_NAME}_processed.flac"
else
	URI="http://icecast:8000/internal/master/${INGEST_NAME}.flac"
fi

if [ "$INGEST_CT" == "" ]; then
	INGEST_CT="audio/${INGEST_CODEC}"
fi

if [ "$INGEST_CODEC_CONTAINER" == "" ]; then
	INGEST_CODEC_CONTAINER="${INGEST_CODEC}"

	if [ "$INGEST_CODEC" == "flac" ]; then 
		INGEST_CODEC_CONTAINER="ogg"
		INGEST_CT="audio/ogg"
	fi
fi

while [ true ]; do
	ffmpeg -re -i "$URI" -c:a "${INGEST_CODEC}" -b:a "${INGEST_BITRATE}k" -f "${INGEST_CODEC_CONTAINER}" -legacy_icecast 1 -content_type "${INGEST_CT}" "icecast://source:${AUTH}@icecast:8000/internal/master/${EGRESS_NAME}"
	sleep 0.1
done
