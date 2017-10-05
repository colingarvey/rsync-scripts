#!/usr/bin/env bash

set -eux
SRC=/volumeUSB1/usbshare1-2/Photos/
TGT=/volume1/Photos
# Nas variables
# nasUser=garveyc1
# nasHost=garveynas.lan
# nasDir=/volume1/Photos

rsync -avu --itemize-changes --progress "${SRC}/" "${TGT}"
