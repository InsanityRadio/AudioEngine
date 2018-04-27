#!/bin/bash


while [ true ]; do
	ffmpeg -i rtmp://rtmp:1935/internal/${INGEST_NAME} -f wav -acodec pcm_s16le -ac 2 - | /usr/bin/stereo_tool_cmd - - -s /config.sts | ffmpeg -i - \
                -c:a pcm_s16le -f flv rtmp://rtmp:1935/internal/${INGEST_NAME}_processed

	sleep 0.1
done
