#!/bin/bash

#     - INGEST_NAME=<%= mount['name'] %>
#     - INGEST_CODEC=<%= mount['codec'] %>
#     - INGEST_PROCESSED=<%= mount['processed'] ? 1 : 0 %>
#     - INGEST_BITRATE=<%= mount['bitrate'] %>

if [ "$INGEST_PROCESSED" == "1" ]; then
	URI="rtmp://rtmp:1935/internal/${INGEST_NAME}_processed"
else
	URI="rtmp://rtmp:1935/internal/${INGEST_NAME}"
fi

while [ true ]; do
	ffmpeg -re $TYPE -i "$URI" -c:a "${INGEST_CODEC}" -b:a "${INGEST_BITRATE}" -f "${INGEST_CODEC}" -legacy_icecast 1 "icecast://source:${AUTH}@icecast:8000/internal/master/${EGRESS_NAME}"
	sleep 0.1
done
