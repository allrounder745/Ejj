#!/bin/bash

INPUT_URL="https://wex55.net/SPORTS_FOX_CRICKET/index.m3u8?token=226b90053b920b7f906879e23cc6c1c7"
RTMP_URL="rtmps://mumbai.onestream.studio:19350/live/live_4139402_v5upz05e3?auth=p_auth_4139402_03wjzhl3u"

echo "Starting restream from $INPUT_URL to $RTMP_URL"

while true; do
  ffmpeg -re -i "$INPUT_URL" \
    -c:v copy -c:a aac -f flv "$RTMP_URL"
  echo "FFmpeg crashed. Restarting in 5 seconds..."
  sleep 5
done
