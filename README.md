# dotfiles

~/ sweet ~/

## About

OS: [Arch Linux](https://www.archlinux.org/)
WM: [i3](https://github.com/i3/i3) / [i3-gaps](https://github.com/Airblader/i3)
Terminal: [kitty](https://github.com/kovidgoyal/kitty)
Compositor: [tryone144/compton](https://github.com/tryone144/compton)
File manager: [ranger](https://github.com/ranger/ranger), [thunar](https://github.com/xfce-mirror/thunar)
Web browser: [firefox](https://www.archlinux.org/packages/extra/x86_64/firefox/)
Lockscreen: [i3lock-color](https://github.com/PandorasFox/i3lock-color)
Wallpaper: [forest lake](./wallpapers)
Wallpaper Manager: [python-pywal](https://github.com/dylanaraps/pywal)

## Screenshots

Coming soon...

## Fonts

noto-fonts
noto-fonts-cjk
noto-fonts-emoji
noto-fonts-extra

inconsolata-psf-git
siji-git (for polybar)
ttf-font-awesome
ttf-comfortaa - rofi
nerd-fonts-complete - rofi

## Packages

| Package Name | Description                | Install                    |
| ------------ | -------------------------- | -------------------------- |
| i3-gaps      | Window manager             | `$ sudo pacman -S i3`      |
| Rofi         | Program launcher           | `$ sudo pacman -S rofi`    |
| Compton      | Compositor                 | `$ sudo pacman -S compton` |
| Feh          | Image viewer and wallpaper | `$ sudo pacman -S feh`     |

xorg
xorg-xinit
polybar
pulseaudio
pulseaudio-alsa
firefox
vim
nano
refind-efi [theme for refind-efi](https://github.com/bobafetthotmail/refind-theme-regular): `$ sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/bobafetthotmail/refind-theme-regular/master/install.sh)"`
git
keybase
keepass
rust
python
visual-studio-code-insiders
steam -> lib32-mesa lib32-nvidia-utils
discord
slack
VLC
xrandr
rofi -> https://gitlab.com/vahnrr/rofi-menus
dmenu
feh
kitty
thunar
scrot -> replaced with maim
imagemagick
redshift
piper - logitech mouse settings
xdg-user-dirs - to update folders in home
syncthing
zsh
unzip
python-pywal
zathura

### AUR packages

See [General Tips](GENERAL_TIPS.md) on how to install an AUR package or install with `$ makepkg -si`.

keybase-bin
oh-my-zsh-git
visual-studio-code-insiders
cava
[i3lock-color](https://github.com/PandorasFox/i3lock-color)
fsearch-git
[compton-tryone-git](https://github.com/tryone144/compton)
joplin

### Configuration

Please check that these files are setup correctly for your machine as they may differ.

- .Xresources (dpi)
- .config/i3status (not using correct labels)
