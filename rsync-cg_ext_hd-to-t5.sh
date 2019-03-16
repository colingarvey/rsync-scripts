#!/usr/bin/env bash

set -eu
datestr=$(date +%Y%m%d_%H%M%S)
logfile=log/${datestr}-$(printf $0 | cut -d '.' -f 2 | tr -d '/').log 
src=/Volumes/cg_exthd_hfs/Photos/2018
tgt=/Volumes/ColinGarvey_T5/Photos

echo $logfile
echo $0
rsync -avu  \
	--ignore-existing \
	--itemize-changes \
	--progress \
	--log-file=${logfile} \
	"${src}/" "${tgt}"
