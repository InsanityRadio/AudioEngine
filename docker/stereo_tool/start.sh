#!/bin/bash


while [ true ]; do
	ffmpeg -i http://icecast:8000/internal/master/${INGEST_NAME}.flac -f wav -acodec pcm_s16le -ac 2 - | /usr/bin/stereo_tool_cmd - - -s /config.sts | ffmpeg -i - \
		-f flac -legacy_icecast 1 -content_type audio/flac icecast://source:${AUTH}@icecast:8000/internal/master/${INGEST_NAME}_processed.flac

	sleep 0.1
done
