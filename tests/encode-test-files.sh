#!/bin/bash

# Encode test files using the built Docker image
docker run --rm -v "$(pwd)":/data handbrake-source test-1080p.mkv
docker run --rm -v "$(pwd)":/data handbrake-source test-4k.mkv 4k