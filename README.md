# Colin's Media Transfer Procedures

## Photos/ rsync protocol
### Transfer from External HDD to NAS
1. Plug external HDD to NAS via USB
2.   ssh to the nas while on LAN
```
ssh garveyc1@garveynas.lan
```

3.  Locate the mounted directory via `mount` and look for keyword `hfsplus`
```
mount
.../dev/sdq2 on /volumeUSB1/usbshare1-2 type hfsplus (ro,relatime,creator=,type=,umask=0,uid=1024,gid=100,nls=utf8,caseless)
```

4. Grab the mountpoint which in this case is `/volumeUSB1/usbshare1-2`
5. Utilize the script at /volume1/Photos/bin/rsync-usb-ext-tonas.sh, updating the source variable as necessary.

Variables are defined in this script as:
```
SRC=/volumeUSB1/usbshare1-2/Photos
TGT=/volume1/Photos
```
### Transfer from NAS to external HDD
1. Plug external HDD to mac
2. Run the rsync script - rsync-nas-to-exthdd.sh
3. Voila!