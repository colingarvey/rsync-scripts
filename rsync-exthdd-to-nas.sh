#!/usr/bin/env bash

set -eux
mountpoint=/Volumes/Photos
exthddDir=/Volumes/cg_exthd_hfs/Photos/2018
nasDir=/Volumes/Photos/2018

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
	--ignore-existing \
	--itemize-changes \
	--progress \
	"${SRC}/" "$TGT"
#	--rsync-path=/bin/rsync \
