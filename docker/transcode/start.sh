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

while [ true ]; do
	ffmpeg -re $TYPE -i "$URI" -f wav -acodec pcm_s16le -ac 2 - | ffmpeg -i - -c:a "${INGEST_CODEC}" -b:a "${INGEST_BITRATE}" -f "${INGEST_CODEC}" "icecast://source:${AUTH}@icecast:8000/internal/master/${EGRESS_NAME}"
	sleep 0.1
done