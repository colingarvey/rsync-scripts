#!/usr/bin/env bash

set -ux
mountpoint=/Volumes/photos
exthddDir=/Volumes/ColinGarvey_T5/Photos
nasDir=/Volumes/photos

SRC=$exthddDir
TGT=$nasDir

if [ $(uname) !=  "Darwin" ]; then
	(>&2 echo "Running from wrong computer, please run on Mac")
	exit 1
fi
# Create dir and mount it 
if [ ! -d ${mountpoint} ]; then 
	sudo mkdir -p ${mountpoint} && sudo chown garveyc1 ${mountpoint}
	mount_smbfs //garveyc1@garveynas.local/Photos ${mountpoint}
fi

rsync -avvu  \
	--itemize-changes \
	--progress \
    --no-perms \
    --no-owner \
    --no-group \
	"${SRC}/" "$TGT"
