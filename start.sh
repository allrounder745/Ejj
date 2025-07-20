#!/bin/bash

INPUT_URL="http://89.36.94.247:49893/ghLs2zdZSnFvSS0000237d27343e876c160a8db5c5404d62ac77c25243d2d6c5808a2a6ac1/index.m3u8?token=8c39d3a5f11d7462c770b55af341dee4"
RTMP_URL="rtmps://mumbai.onestream.studio:19350/live/live_4139402_v5upz05e3?auth=p_auth_4139402_03wjzhl3u"

echo "Starting restream from $INPUT_URL to $RTMP_URL"

while true; do
  ffmpeg -re -i "$INPUT_URL" \
    -c:v copy -c:a aac -f flv "$RTMP_URL"
  echo "FFmpeg crashed. Restarting in 5 seconds..."
  sleep 5
done
