#!/bin/bash

# Create 1080p test video files using ffmpeg in Docker
docker run --rm -it \
  -v $(pwd):/config \
  linuxserver/ffmpeg \
  -f lavfi \
  -i testsrc=duration=60:size=1920x1080:rate=24 \
  -vcodec libx264 \
  /config/test-files/test-1080p.mkv

# Create 4K test video files using ffmpeg in Docker
docker run --rm -it \
  -v $(pwd):/config \
  linuxserver/ffmpeg \
  -f lavfi \
  -i testsrc=duration=60:size=3840x2160:rate=24 \
  -vcodec libx265 \
  /config/test-files/test-4k.mkv