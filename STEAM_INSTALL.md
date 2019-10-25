# Steam Install

Most of the info can be found on the [arch linux steam page](https://wiki.archlinux.org/index.php/Steam).

Enable Multilib by uncommenting multilib section in pacman configuration.

```bash
$ sudo vim /etc/pacman.conf
```

Install the driver package for [your GPU](https://wiki.archlinux.org/index.php/Xorg#Driver_installation)

```bash
$ sudo pacman -Syu lib32-mesa lib32-nvidia-utils
```

Install ttf-liberation for fonts

```bash
$ sudo pacman -Syu ttf-liberation
```

Reboot

```bash
$ reboot
```

## Troubleshooting

`` try to update your ... or make sure you have lib32-nvidia-utils installed.

If your dual screen breaks, check that your monitor names have not changed using `xrandr`; the monitor names may have changed after the reboot.
If you are setting your monitors using xrandr, check that it is calling them correctly.
