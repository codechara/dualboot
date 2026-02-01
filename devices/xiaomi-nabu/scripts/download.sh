#!/usr/bin/bash
set -uexo pipefail

if [[ "$CUSTOM_URL" != "" ]]; then
	curl -L "$CUSTOM_URL" --output release.7z
	7z x -orelease release.7z
else
	basedir=$(dirname $0)
	latest_url=$($basedir/get_latest_release_url.py)
	curl -L "$latest_url" --output release.7z
	7z x -orelease release.7z
fi
