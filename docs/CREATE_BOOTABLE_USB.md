# Create Bootable USB

**Linux**

1. Install `.iso` for OS you would like to install

2. Determine the device id and partition

```bash
sudo fdisk -l
```

_In our case we'll assume ours is on `/dev/sdx`_

3. Format disk to FAT32

```bash
sudo mkfs.vfat /dev/sdx
```

4. Unmount the disk

```bash
sudo umount /dev/sdx
```

5. Disk dump / write using block size of 4M

```bash
dd bs=4M if=path/to/archlinux.iso of=/dev/sdx status=progress oflag=sync
```

**Windows**

1. Install `.iso` for OS you would like to install

2. Use [Rufus](https://rufus.ie/) to format and create bootable USB
