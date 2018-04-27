#!/bin/bash

if [ "$INGEST_TYPE" == "card" ]; then
	TYPE="-f alsa -ar 44100"
else
	TYPE=
fi

while [ true ]; do
	ffmpeg -re $TYPE -i "$INGEST_URI" -f wav -acodec pcm_s16le -f flv "rtmp://rtmp:1935/internal/${INGEST_NAME}"
	sleep 0.1
done
