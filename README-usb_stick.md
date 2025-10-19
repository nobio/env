# Creating bootable Linux USB using Mac

CentOS, Ubuntu, Slackware, etc. Whatever Linux-based OS it is, you can create a bootable USB for it by using a Mac.

## 1. Prepare the .iso file

Download it, copy it, whatever it takes to prepare that Linux-based OS .iso file

## 2. Convert the .iso file into a .img.dmg
```bash
hdiutil convert -format UDRW -o linux.img linux.iso
```
**Output**
```bash
Reading Master Boot Record (MBR : 0)…
Reading CentOS 7 x86_64                  (Apple_ISO : 1)…
Reading  (Type EF : 2)…
Reading CentOS 7 x86_64                  (Apple_ISO : 3)…
.........................................................
Elapsed Time: 30.450s
Speed: 143.7Mbytes/sec
Savings: 0.0%
created: /tmp/linux.img.dmg
```
## 3. List the drives of the Mac
```bash
diskutil list
```
**Output**
```bash
/dev/disk0 (internal, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                        *500.3 GB   disk0
   1:                        EFI EFI                     209.7 MB   disk0s1
   2:                 Apple_APFS Container disk1         500.1 GB   disk0s2

/dev/disk1 (synthesized):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      APFS Container Scheme -                      +500.1 GB   disk1
                                 Physical Store disk0s2
   1:                APFS Volume Macintosh HD            446.8 GB   disk1s1
   2:                APFS Volume Preboot                 37.9 MB    disk1s2
   3:                APFS Volume Recovery                519.0 MB   disk1s3
   4:                APFS Volume VM                      3.2 GB     disk1s4

/dev/disk2 (external, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:     FDisk_partition_scheme                        *31.4 GB    disk2
   1:             Windows_FAT_32 NO NAME                 31.4 GB    disk2s1
```
Make sure to note the device that identifies the flash drive. In this case it is `/dev/disk2`
## 4. Unmount the flash drive
```bash
diskutil unmountDisk /dev/disk2
```
**Output**
```bash
Unmount of all volumes on disk2 was successful
```

## 5. Copy the .img.dmg to the flash drive
```bash
time sudo dd if=linux.img.dmg of=/dev/disk2 bs=1m
```
**Output**
```bash
Password: 
4375+1 records in
4375+1 records out
4588007424 bytes transferred in 1720.352991 secs (2666899 bytes/sec)

real	28m54.116s
user	0m0.059s
sys	1m0.412s
```