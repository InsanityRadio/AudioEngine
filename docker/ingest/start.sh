#!/bin/bash

if [ "$INGEST_TYPE" == "card" ]; then
	TYPE="-f alsa -ar 44100"
else
	TYPE=
fi

while [ true ]; do
	ffmpeg -re $TYPE -i "$INGEST_URI" -f wav -acodec pcm_s16le -ac 2 - | ffmpeg -i - -legacy_icecast 1 -content_type audio/flac "icecast://source:${AUTH}@icecast:8000/internal/master/${INGEST_NAME}.flac"
	sleep 0.1
done