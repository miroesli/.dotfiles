# dotfiles

~/ sweet ~/

## My Fonts

noto-fonts
noto-fonts-cjk
noto-fonts-emoji
noto-fonts-extra

inconsolata-psf-git
siji-git (for polybar)
ttf-font-awesome

## My packages

| Package Name                | Description                   | Install                      |
|-----------------------------|-------------------------------|------------------------------|
| i3-gaps                     | Window manager                | `$ sudo pacman -S i3`        |
| Rofi                        | Program launcher              | `$ sudo pacman -S rofi`      |
| Compton                     | Compositor                    | `$ sudo pacman -S compton`   |
| Feh                         | Image viewer and wallpaper    | `$ sudo pacman -S feh`       |

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
rofi
dmenu
feh
kitty
thunar
scrot -> replaced with maim
imagemagick
redshift
piper - logitech mouse settings
xdg-user-dirs - to update folders in home

### AUR packages

See [General Tips](GENERAL_TIPS.md) on how to install an AUR package or install with `$ makepkg -si`.

keybase-bin
visual-studio-code-insiders
cava
[i3lock-color](https://github.com/PandorasFox/i3lock-color)
fsearch-git
[compton-tryone-git](https://github.com/tryone144/compton)
wal

### Configurations that may differ

Please check that these files and folder are setup correctly for your machine.

- .Xresources (dpi)
- .config/i3status (not using correct labels)