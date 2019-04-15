#!/usr/bin/env python3

import datetime
import os
import subprocess

from sys import platform
from sys import exit
from subprocess import run


TESTING = False
_datestr = datetime.datetime.now().strftime('%Y%m%d_%H%M%S')
photos_remotepath = "//garveyc1@garveynas.local/Photos"
photos_mountpoint = "/mnt/photos"
ext_ssd_mountpoint = "/Volumes/ColinGarvey_T5"

SRC_TGTS = [
    (os.path.join(ext_ssd_mountpoint, "Photos"), photos_mountpoint),
    (
        os.path.join(ext_ssd_mountpoint, "Videos"),
        os.path.join(photos_mountpoint, "Videos"),
    ),
]

if platform != "darwin":
    exit("Running from wrong computer, please run on Mac")

# Create dir and mount it
print('Mounting {} to {}'.format(photos_remotepath, photos_mountpoint))
if not os.path.ismount(photos_mountpoint):
    os.makedirs(photos_mountpoint, exist_ok=True)
    run(["mount_smbfs", photos_remotepath, photos_mountpoint])

assert(os.path.ismount(photos_mountpoint))
for source, target in SRC_TGTS:
    LOGFN = "{}_rsync.log".format(_datestr)
    LOGFILE = os.path.join('log', LOGFN)

    if not os.path.exists('log'):
        os.makedirs('log')

    if not source.endswith('/'):
        source = source + '/'

    cmd = [
        "rsync",
        "-avu",
        "--itemize-changes",
        "--progress",
        "--no-perms",
        "--no-owner",
        "--no-group",
        "--log-file={}".format(LOGFILE),
        source,
        target,
    ]

    if TESTING:
        cmd.insert(-2, '--dry-run')
        print("DRY RUN!")
    print("Synchronizing {} to {}".format(source, target))
    run(cmd)

# unmount directories
print('Unmounting {}'.format(photos_mountpoint))
run(["umount", photos_mountpoint])
