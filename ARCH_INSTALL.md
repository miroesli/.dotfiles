# Arch Install

You can also follow the installation instructions on the [Archlinux](https://wiki.archlinux.org/index.php/Installation_guide) website.

## Preparation

1. [Download](https://archlinux.org/download/) ISO and GPG files (usually under Checksums)

### On Windows

2. [Download](https://rufus.ie/) rufus
3. Download [GnuPG](https://www.gnupg.org/download/index.html) and verify the signature using

```bash
$ gpg --keyserver-options auto-key-retrieve --verify archlinux-version-x86_64.iso.sig
```

Alternatively, verify the authenticity of the signature by checking if the public key's fingerprint is identical to the key fingerprint of the [Arch Linux developer](https://www.archlinux.org/people/developers/) who signed it.

1. Create a bootable usb by selecting the ISO in Rufus

### On Linux

2. Verify the ISO file: `$ pacman-key -v archlinux-<version>.iso.sig`
3. Create a bootable usb with: `# dd if=archlinux*.iso of=/dev/sdX && sync`

## Boot into your portable ARCH drive

When initially rebooting make sure secure boot is off. If it doesn't find a vmlinuz or loader.efi file then attempt to rename either file with the .efi suffix/file type.

1. Verify boot mode (only for UEFI)

```bash
$ ls /sys/firmware/efi/efivars
```

2. Connect to Internet

```bash
$ wifi-menu
```

Or configure manually using files in /etc/netctl/examples

Check connection with

```bash
$ ping archlinux.org
```

3. Update Pacman databases

```bash
$ pacman -Syy
```

4. Set timedatectl

```bash
$ timedatectl set-ntp true
```

Check status with:

```bash
$ timedatectl status
$ hwclock --show
```

If dual booting with windows, your time may be incorrect on the linux machine right now. To correct this check the [Arch linux Instructions](https://wiki.archlinux.org/index.php/System_time#UTC_in_Windows) or the [tutorial here](https://www.howtogeek.com/323390/how-to-fix-windows-and-linux-showing-different-times-when-dual-booting/).

If the local time and hardware clock are still not your current time, download the [ntp](https://wiki.archlinux.org/index.php/Network_Time_Protocol_daemon) package and update the time.

```bash
$ pacman -S ntp
$ ntpd -qg
$ hwclock [-systohc/-hctosys] # use systohc or hctosys accordingly
```

Note: `systohc` updates the hardware clock to the system clock, and `hwtosys` does the reverse.

5. Configure mirror list using reflector

```bash
$ pacman -S reflector
$ reflector -c "Country" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist
```

## Partition the disk

1. Determine the disk drive you're partitioning using the [command](https://wiki.archlinux.org/index.php/Partitioning#Partitioning_tools) below.

```bash
$ lsblk
```

Alternatively,

```bash
$ fdisk -l
```

2. Check how much free space it has using gdisk -l /dev/`diskname` (replace `diskname` with the disk you decided on from the previous command.)

Start partitioning the disk drive that you determined above.

```bash
$ cgdisk /dev/sdX
```

Alternatively

```bash
$ cfdisk /dev/sdX
```

3. Create your partitions as you would like. See the archlinux [installation guide](https://wiki.archlinux.org/index.php/Partitioning) for help on this.

**Recommended method**

Create a root partition of around 10GB (Optional)
Create an efi partition of around 512MB `Note: Only create this if you are not dual booting. Otherwise use the existing EFI in the other OS.`
Create a swap partition between square root of RAM and double RAM. Usually equal to ram is fine. See [this link](https://itsfoss.com/swap-size/) for more info.
Create your home partition with the rest of your memory.

<!-- #### Encrypt Linux partition (optional)

```bash
$ cryptsetup luksFormat --type luks1 /dev/sdxY
$ cryptsetup luksOpen /dev/sdxY luks
``` -->

4. Format the partitions

<!-- ##### For root drive

If you encrypted in the step before, use this command.

```bash
$ mkfs.btrfs -L btrfs /dev/mapper/luks
```

Otherwise use this one. -->

For root/home drives

```bash
$ mkfs.ext4 -L "Arch Linux" /dev/sdxY # `-L "Arch Linux"` is optional
```

For EFI

Note: Only format this if you created a new EFI.

```bash
$ mkfs.fat -F32 /dev/sdxY # May differ according to bootloader being used
```

For swap

```bash
$ mkswap -L "Linux Swap" /dev/sdxY # `-L "Linux Swap"` is optional
$ swapon /dev/sdxY
```

Check if swap is enabled

```bash
$ free -m
```

5. Mount disk drives to system

For root

```bash
$ mount /dev/sdxY /mnt
```

6. Mount any other partitions made here except `efi` and `swap` drives. Make sure to create their respective directories with mkdir. For example, this is when you would mount your home directory if you made a seperate one from the root.

7. Use the command below to check that everything was done correctly:

```bash
$ df
```

## Install Arch Linux

1. Add proxy

If behind a proxy you can configure an environment variable to send your packets through it.

example: replace the ip and port accordingly

```bash
$ export http_proxy=http://10.1.33.241:3128
```

2. Install base system

```bash
$ pacstrap /mnt base base-devel
```

3. Mount efi now (only do this if dual booting)

For EFI

Note: If you are dual booting, remember to use the efi from the existing OS. Also make sure to create the according folder structure in /mnt.

```bash
$ mkdir /mnt/boot/efi
$ mount /dev/sdxY /mnt/boot/efi (or /mnt/boot or /mnt/efi)
```

4. Generate fstab

```bash
$ genfstab -U /mnt >> /mnt/etc/fstab # optionally use -p instead of -U
```

5. Check the output

```bash
$ cat /mnt/etc/fstab
```

6. login to newly created system

```bash
$ arch-chroot /mnt [/bin/bash]
```

7. Create a password

```bash
$ passwd [...]
```

8. Set Timezone

```bash
$ ln -sf /usr/share/zoneinfo/Country/City /etc/localtime
$ hwclock --systohc # optional, do this if the system clock doesn't update.
```

9. Let us generate initial RAM disk (optional)

Creating a new initramfs is usually not required, because mkinitcpio was run on installation of the kernel package with pacstrap. If you would like to generate the initial RAM disk regardless, the command is below.

```bash
$ mkinitcpio -p linux
```

10. Install text editors

```bash
$ pacman -S vim nano # nano is easier for newer linux users. I personally like vim.
```

12. Localisation

```bash
$ nano /etc/locale.gen # and uncomment en_US.UTF-8
$ locale-gen
$ echo "LANG=en_US.UTF-8" >> /etc/locale.conf
```

13. Network Configuration

```bash
$ echo hostname >> /etc/hostname # replace the first hostname with your preferred hostname. This will appear in a terminal as such: "username@hostname$ ..."
$ nano /etc/hosts
```

Edit /etc/hosts like the following

```bash
127.0.0.1 localhost
::1       localhost
127.0.1.1 hostname.localdomain hostname # replace hostname with your preferred host
```

or

```bash
127.0.0.1 localhost.localdomain localhost
::1       localhost.localdomain localhost
127.0.1.1 localhost.localdomain hostname
```

<!-- #### Create a password

```bash
$ passwd [...]
``` -->

14. Setup bootloader

```bash
$ pacman -S grub efibootmgr os-prober --target=x86_64-efi --efi-directory=efi --bootloader-id=GRUB # everything past efibootmgr is required if you set your efi in a directory other than /mnt/boot/efi
$ grub-install [/dev/sdX]
$ grub-mkconfig -o /boot/grub/grub.cfg
```

If your bootmanager later complains that there are missing files like vmlinuz use this command in arch-chroot: `pacman -S linux`

Alternatively to grub, you can use rEFInd.

```bash
$ pacman -S refind-efi
$ refind-install
```

15. Confirm that your boot manager was installed

Grub

```bash
$ ls -l /boot/efi/EFI/arch/
```

rEFInd

```bash
$ ls -l /boot/efi/EFI/refind/
```

16. Install network packages

Ensure you have a network manager for connecting to wifi

```bash
$ which NetworkManager
```

If not, Install

```bash
$ pacman -S networkmanager network-manager-applet nm-connection-editor
```

Alternatively/Optionally install dialog to be able to connect to wifi with wifi-menu

```bash
$ pacman -S dialog netctl
```

<!-- Alternatively

```bash
$ pacman -S wcid
``` -->

17. Create a new user

```bash
$ useradd -m -g users -G wheel [-s /bin/bash] "username"
$ passwd "..."
$ EDITOR=nano visudo # uncomment "wheel All=(All) All"
```

18. Unmount and reboot

```bash
$ exit # or Ctrl+D or ^D
$ umount -R /mnt
$ reboot
```

**At this point you can remove your removable media. Congratulations!**

## Final system configuration

1. First login with the password you set for your new user, and connect to wifi.

2. Install audio, display, and window manager packages

| Package                      | Description               | Alternative(s)
|------------------------------|---------------------------|----------------------|
| pulseaudio + pulseaudio-alsa | Audio driver              |
| xorg + xorg-xinit            | Display server            | wayland
| firefox                      | Web browser               |  
| sddm                         | Display \ Login manager   | lightdm, gdm
| i3                           | Window manager            | gnome-desktop, xfce4

```bash
$ sudo pacman -S pulseaudio pulseaudio-alsa xorg xorg-xinit firefox i3 sddm
$ sudo systemctl enable sddm.service # replace `sddm` with `gdm` if you installed that instead
```

3. Setup so it starts from boot

```bash
$ echo "exec i3" > ~/.xinitrc # replace i3 with the start command for your window manager like startxfce4 for xfce
$ startx
```

4. Install any other fonts or packages such as the ones showin in the [README](./README.md)

## Some Useful Links

- [Linux surface driver fixes](https://github.com/dmhacker/arch-linux-surface)
- [Adding additional surface tools to work with arch](https://github.com/Surface-Pro-3/surface-tools)
- [Dual boot windows with arch on linux surface pro 4](https://ramsdenj.com/2016/08/29/arch-linux-on-the-surface-pro-4.html)
- [Install arch under 10 minutes tutorial](https://www.youtube.com/watch?v=GKdPSGb9f5s&app=desktop)
- [Foss install arch](https://itsfoss.com/install-arch-linux/)
- [Dual booting](https://www.youtube.com/watch?v=METZCp_JCec)
- [Dual booting with OS on another disk](https://unix.stackexchange.com/questions/252936/grub2-boot-to-a-second-another-hard-disk)
- [Dual booting Foss help](https://itsfoss.com/no-grub-windows-linux/)
- [Reddit thread external link](https://ramsdenj.com/2016/04/15/multi-boot-linux-with-one-boot-partition.html)
- [Installing refind](https://wiki.archlinux.org/index.php/REFInd)
