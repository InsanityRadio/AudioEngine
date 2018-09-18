#!/bin/bash

sleep 0.5

while [ true ]; do
	ffmpeg -re -i http://icecast:8000/internal/master/${INGEST_NAME}.flac -f wav -acodec pcm_s16le -ac 2 - | /usr/bin/stereo_tool_cmd - - -s /config.sts | ffmpeg -re -i - \
		-c:a flac -f ogg \
		-legacy_icecast 1 -content_type audio/ogg icecast://source:${AUTH}@icecast:8000/internal/master/${INGEST_NAME}_processed.flac

	sleep 0.1
done
