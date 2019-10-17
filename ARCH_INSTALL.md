# Arch Install

## Steps

### As base OS as shown [here](https://wiki.archlinux.org/index.php/Installation_guide)

When initially rebooting make sure secure boot is off, and fast shutodnw/boot is disabled as well. If it doesn't find a vmlinuz or loader.efi file then rename either file with the .efi suffix

31.25 on c
375 on d

#### Verify key for archlinux

```bash
$ pacman-key -v archlinux-version-x86_64.iso.sig
```

#### Verify boot mode (only for UEFI)

```bash
$ ls /sys/firmware/efi/efivars
```

#### Connect to Internet

```bash
$ wifi-menu
```

Or configure manually using files in /etc/netctl/examples

Check connection with 

```bash
$ ping archlinux.org
```

#### Set timedatectl

```bash
$ timedatectl set-ntp true
```

Check status with:

```bash
$ timedatectl status
```

#### Update Pacman databases

```bash
$ pacman -Syy
```

#### Configure mirror list using reflector

```bash
$ pacman -S reflector
$ reflector -c "Country" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist
```

#### Partition the disk

Determine the disk drive you're partitioning using the command below.

```bash
$ lsblk
```

Alternatively 

```bash
$ fdisk -l
```

check how much free space it has using gdisk -l /dev/sd`X` (replace x with the letter from any listed from the previous command.)

Start partitioning the disk drive that you determined above.

```bash
$ cgdisk /dev/sdX
```

Alternatively

```bash
$ cfdisk /dev/sdX
```

Create your partitions as you would like. See the archlinux [installation guide]() for help on this.

##### Recommended method

Create a root partition of around 10GB
Create an efi partition of around 500MB `Note: Only create this if you are not dual booting.`
Create a swap partition between square root of RAM and double RAM. Usually equal to ram is fine. See [this link](https://itsfoss.com/swap-size/) for more info.
Create your home partition with the rest of your memory.

<!-- #### Encrypt Linux partition (optional)

```bash
$ cryptsetup luksFormat --type luks1 /dev/sdxY
$ cryptsetup luksOpen /dev/sdxY luks
``` -->

#### Format the partitions

<!-- ##### For root drive

If you encrypted in the step before, use this command.

```bash
$ mkfs.btrfs -L btrfs /dev/mapper/luks
```

Otherwise use this one. -->

For root

```bash
$ mkfs.ext4 -L "Arch Linux" /dev/sdxY # `-L "Arch Linux"` is optional
```

<!-- #### Others -->

For EFI

Note: Only format this if you created a new EFI. 
Note2: mkfs.fat and mkfs.vfat are the same command.

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

#### Mount disk drives to system

For root

```bash
$ mount /dev/sdxY /mnt
```

Mount any other partitions made here other than the efi and swap. Make sure to create their respective directories with mkdir.

Note: For example, this is where you would mount your home directory if you made a seperate one from the root.

Use the command below to check that everything was done correctly:

```bash
$ df
```

#### Proxy

If behind a proxy you can configure an environment variable to send your packets through it.

example; replace the ip and port accordingly

```bash
$ export http_proxy=http://10.1.33.241:3128 
```

#### Install base system

```bash
$ pacstrap /mnt base base-devel
```

#### Mount efi now (only do this if dual booting)

For EFI

Note: If you are dual booting, remember to use the efi from the existing OS. Also make sure to create the according folder structure in /mnt.

```bash
$ mkdir /mnt/boot/efi
$ mount /dev/sdxY /mnt/boot/efi (or /mnt/boot or /mnt/efi)
```

#### Generate fstab

```bash
$ genfstab -U /mnt >> /mnt/etc/fstab # optionally use -p instead of -U
```

Check the output 

```bash
$ cat /mnt/etc/fstab
```

#### login to newly created system

```bash
$ arch-chroot /mnt [/bin/bash]
```

#### Create a password

```bash
$ passwd [...]
```

#### Set Timezone

```bash
$ ln -sf /usr/share/zoneinfo/Country/City /etc/localtime
$ hwclock --systohc # optional, do this if the system clock doesn't update.
```

#### Let us generate initial RAM disk (optional)

Creating a new initramfs is usually not required, because mkinitcpio was run on installation of the kernel package with pacstrap. If you would like to generate the initial RAM disk regardless, the command is below.

```bash
$ mkinitcpio -p linux
```

#### Install text editors

```bash
$ pacman -S vim nano # nano is easier for newer linux users. I personally like vim.
```

#### Localisation

```bash
$ nano /etc/locale.gen # and uncomment en_US.UTF-8
$ locale-gen
$ echo "LANG=en_US.UTF-8" >> /etc/locale.conf
```

#### Network Configuration 

```bash
$ echo hostname >> /etc/hostname # replace the first hostname with your preferred hostname. This will appear in a terminal as such: "username@hostname$ ..."
$ nano /etc/hosts
```

Edit /etc/hosts like the following

```
127.0.0.1 localhost
::1       localhost
127.0.1.1 hostname.localdomain hostname # replace hostname with your preferred host
```

or

```
127.0.0.1 localhost.localdomain localhost
::1       localhost.localdomain localhost
127.0.1.1 localhost.localdomain hostname
```

<!-- #### Create a password

```bash
$ passwd [...]
``` -->

#### Setup bootloader and install wifi required packages

```bash
$ pacman -S grub efibootmgr os-prober --target=x86_64-efi --efi-directory=efi --bootloader-id=GRUB # everything past efibootmgr is required if you set your efi in a directory other than /mnt/boot/efi
$ grub-install [/dev/sdX]
$ grub-mkconfig -o /boot/grub/grub.cfg
```

Note: if you do not like grub see second bootloader instructions further below.

Confirm that grub has installed

```
$ ls -l /boot/efi/EFI/arch/
```

If your bootmanager later complains that there are missing files like vmlinuz use this command in arch-chroot: `pacman -S linux`

Alternatively to grub, you can use rEFInd.

```bash
$ pacman -S refind-efi
$ refind-install
```

Confirm that refind has installed

```
$ ls -l /boot/efi/EFI/refind/
```

#### Install network packages

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
$ pacman -S wpa_supplicant wcid
``` -->

<!-- #### Create a new user

```bash
$ useradd -m -g users -G wheel [-s /bin/bash] username
$ passwd username # Set the password
``` -->

#### Unmount and reboot

```bash
$ exit # or Ctrl+D or ^D
$ umount -R /mnt
$ reboot
```

**At this point you can remove your removable media. Congratulations!**

#### Create a new user

login as root

```bash
$ useradd -m -g users -G wheel [-s /bin/bash] "username"
$ passwd "..."
$ EDITOR=nano visudo #uncomment "wheel All=(All) All"
```

#### Reboot

```bash
$ exit
$ reboot
```

#### Install packages

First login with the password you set for your new user, connect to wifi, then install the packages

```bash
$ sudo pacman -S pulseaudio pulseaudio-alsa xorg xorg-xinit firefox sddm # Can also use other diplay manager other than sddm like gdm (from gnome)
$ sudo systemctl enable sddm.service # replace sddm with gdm if you installed that instead
```

#### Setup Desktop Environment

Install your desired desktop environment

```bash
$ sudo pacman -S i3 # or xfce or gnome-dekstop or others!
```

Setup so it starts from boot

```bash
$ echo "exec i3" > ~/.xinitrc #or whatever the start command is for your desktop env like startxfce4 for xfce
$ startx
```

## Most Useful Links
* [Linux surface driver fixes](https://github.com/dmhacker/arch-linux-surface)
* [Adding additional surface tools to work with arch](https://github.com/Surface-Pro-3/surface-tools)
* [dual boot windows with arch on linux surface pro 4](https://ramsdenj.com/2016/08/29/arch-linux-on-the-surface-pro-4.html)
* [Install arch under 10 minutes tutorial](https://www.youtube.com/watch?v=GKdPSGb9f5s&app=desktop)
* [Foss install arch](https://itsfoss.com/install-arch-linux/)

## Sort the steps below

## Packages

xorg
xorg-xinit
sddm
xfce4
i3 - 1 3 4 5
pulseaudio
pulseaudio-alsa
firefox
vim
nano
refind-efi
git
keybase
keepass
rust
python
vscode
steam
discord
slack
VLC

## Fonts

noto-fonts
noto-fonts-cjk
noto-fonts-emoji
noto-fonts-extra

- linux still doesn't show up on grub boot manager. Try these links.

* [Dual booting](https://www.youtube.com/watch?v=METZCp_JCec)
* [Dual booting with OS on another disk](https://unix.stackexchange.com/questions/252936/grub2-boot-to-a-second-another-hard-disk)
* [Dual booting help](https://itsfoss.com/no-grub-windows-linux/)
* [CHECK THIS](https://superuser.com/questions/182161/grub-how-find-partition-number-hd0-x)
* [AND THIS](https://unix.stackexchange.com/questions/8867/install-grub-on-hard-disk-used-in-another-system)
* [maybe do this?](https://unix.stackexchange.com/questions/378705/how-to-get-grub-menu-from-windows-10)
* [Reddit thread external link](https://ramsdenj.com/2016/04/15/multi-boot-linux-with-one-boot-partition.html)
* [efi check if windows is on](https://bbs.archlinux.org/viewtopic.php?id=240117)
* [installing refind](https://wiki.archlinux.org/index.php/REFInd)

Need to figure out how to get the EFI to detect things on another repo.

Best solution thus far is in this thread [here](https://www.reddit.com/r/archlinux/comments/7uox5m/multiple_efi_partitions/)

Reset windows EFI: https://forums.tomshardware.com/faq/how-to-repair-efi-bootloader-in-windows-10.3275168/

Other links: 

https://bbs.archlinux.org/viewtopic.php?id=242010

https://www.reddit.com/r/archlinux/comments/7uox5m/multiple_efi_partitions/

If I were you, I would follow these steps:

    Boot from an Arch live system

    Mount your main system root to /mnt (mount /dev/sda2 /mnt)

    Mount the EFI partition to /boot/efi (mount /dev/sda1 /mnt/boot/efi)

    chroot to your main system root (arch-chroot /mnt)

    Back up Microsoft/ directory from the EFI partition to a temporary location (cp -R /boot/efi/EFI/Microsoft/ /)

    Uninstall grub (pacman -Rsn grub)

    Empty the EFI partition (rm -R /boot/efi/*)

    Install refind to the system (pacman -Syu refind-efi)

    Install refind to the EFI (refind-install)

    Move back the Microsoft/ directory you've previously backed up to /boot/efi/EFI/ (mv /Microsoft/ /boot/efi/EFI/)

    ^D

    reboot

    Make sure everything boots up properly

    Configure /boot/refind_linux.conf(current linux system startup options, i.e. add processor microcode to the kernel launch parameters or set up different startup configurations

    ) and /boot/efi/EFI/refind/refind.conf(refind settings)

P.S. Refind detects Linux systems automatically but doesn't do so for Windows, that's why we need to mess with the Microsoft/ dir

https://ramsdenj.com/2016/04/15/multi-boot-linux-with-one-boot-partition.html
