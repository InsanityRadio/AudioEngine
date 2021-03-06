#!/bin/bash

if [ "$INGEST_TYPE" == "card" ]; then
	TYPE="-f alsa -ar 44100"
else
	TYPE=
fi

while [ true ]; do
	/opt/ffmpeg/bin/ffmpeg  -re $TYPE -i "$INGEST_URI" -c:a flac -f ogg -legacy_icecast 1 -content_type audio/ogg "icecast://source:${AUTH}@icecast:8000/internal/master/${INGEST_NAME}.flac"
	sleep 0.1
done
