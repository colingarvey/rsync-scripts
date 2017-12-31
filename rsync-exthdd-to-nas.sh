#!/usr/bin/env bash

set -eux

exthddDir=/Volumes/cg_exthd_hfs/Photos
# Nas variables
nasUser=garveyc1
nasHost=garveynas.local
nasDir=/Volumes/Photos-2

# nasConnect=$nasUser@$nasHost:$nasDir  Commented out to avoid ssh overhead
SRC=$exthddDir
TGT=$nasDir

if [ $HOSTNAME !=  "garveyc1-ZSH03M" ]; then
	(>&2 echo "Running from wrong computer, please run on Mac")
	exit 1
fi

rsync -avvu  \
	--no-whole-file \
	--inplace \
	--itemize-changes \
	--progress \
	"${SRC}/" "$TGT"
#	--rsync-path=/bin/rsync \
