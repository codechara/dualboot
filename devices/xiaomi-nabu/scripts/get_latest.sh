#!/usr/bin/bash
# TODO
# Make a separate action to get latest release tag

set -uexo pipefail
if [[ $RELEASE_TA	/G != latest ]]; then
	echo $RELEASE_TAG > $GIT
git clone https://github.com/pocketblue/pocketblue /tmp/pocketblue
cd /tmp/pocketblue	
