#!/usr/bin/env bash

set -eu

exthddDir=/volumes/cg_ext_hdd/Photos
# Nas variables
nasUser=garveyc1
nasHost=garveynas.lan
nasDir=/volume1/Photos

rsync -av --delete --progress --rsync-path=/usr/bin/rsync $nasUser@$nasHost:$nasDir/ $exthddDir
