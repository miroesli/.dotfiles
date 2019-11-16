# Among Trees

## About

OS: [Arch Linux](https://www.archlinux.org/)\
WM: [i3](https://github.com/i3/i3) / [i3-gaps](https://github.com/Airblader/i3)\
Terminal: [kitty](https://github.com/kovidgoyal/kitty)\
Compositor: [tryone144/compton](https://github.com/tryone144/compton)\
File manager: [ranger](https://github.com/ranger/ranger), [thunar](https://github.com/xfce-mirror/thunar)\
Web browser: [firefox](https://www.archlinux.org/packages/extra/x86_64/firefox/)\
Lockscreen: [i3lock-color](https://github.com/PandorasFox/i3lock-color)\
Wallpaper: [forest lake](./wallpapers)\
Wallpaper Manager: [python-pywal](https://github.com/dylanaraps/pywal)\

## Fonts

| Package Name               | Used For | Install |
| -------------------------- | -------- | ------- |
| noto-fonts                 |          |         |
| noto-fonts-cjk             |          |         |
| noto-fonts-emoji           |          |         |
| noto-fonts-extra           |          |         |
| **Packages in AUR**        | -        | -       |
| inconsolata-psf-git        |          |         |
| siji-git (for polybar)     |          |         |
| ttf-font-awesome           |          |         |
| ttf-comfortaa - rofi       |          |         |
| nerd-fonts-complete - rofi |          |         |

## Packages

| Package Name                                                                    | Description                           | Install                    |
| ------------------------------------------------------------------------------- | ------------------------------------- | -------------------------- |
| i3-gaps                                                                         | Window manager                        | `$ sudo pacman -S i3`      |
| Rofi                                                                            | Program launcher                      | `$ sudo pacman -S rofi`    |
| Compton                                                                         | Compositor                            | `$ sudo pacman -S compton` |
| Feh                                                                             | Image viewer and wallpaper            | `$ sudo pacman -S feh`     |
| xorg                                                                            |                                       |                            |
| xorg-xinit                                                                      |                                       |                            |
| polybar                                                                         |                                       |                            |
| pulseaudio                                                                      |                                       |                            |
| pulseaudio-alsa                                                                 |                                       |                            |
| firefox                                                                         |                                       |                            |
| vim                                                                             |                                       |                            |
| refind-efi                                                                      | Boot manager                          |                            |
| [refind-theme-regular](https://github.com/bobafetthotmail/refind-theme-regular) | Theme for refind-efi                  |                            |
| git                                                                             |                                       |                            |
| keybase                                                                         |                                       |                            |
| keepassxc                                                                       |                                       |                            |
| rust                                                                            |                                       |                            |
| python                                                                          |                                       |                            |
| steam                                                                           |                                       |                            |
| lib32-mesa                                                                      | Open Source Nvidia driver (for steam) |                            |
| lib32-nvidia-utils                                                              | Proprietary Nvidia driver (for steam) |                            |
| discord                                                                         |                                       |                            |
| slack                                                                           |                                       |                            |
| VLC                                                                             |                                       |                            |
| rofi                                                                            |                                       |                            |
| [rofi-menus](https://gitlab.com/vahnrr/rofi-menus)                              | Theme for rofi                        |                            |
| dmenu                                                                           |                                       |                            |
| python                                                                          |                                       |                            |
| python                                                                          |                                       |                            |
| kitty                                                                           |                                       |                            |
| thunar                                                                          |                                       |                            |
| scrot                                                                           |                                       |                            |
| maim                                                                            |                                       |                            |
| imagemagick                                                                     |                                       |                            |
| redshift                                                                        |                                       |                            |
| piper                                                                           | Logitech mouse settings               |                            |
| xdg-user-dirs                                                                   | Generate folders in home              |                            |
| syncthing                                                                       |                                       |                            |
| zsh                                                                             |                                       |                            |
| unzip                                                                           |                                       |                            |
| python-pywal                                                                    | Generate color theme                  |                            |
| zathura                                                                         | Pdf viewer                            |                            |
| [zsh-theme-powerlevel9k](https://github.com/Powerlevel9k/powerlevel9k)          |                                       |                            |
| [zsh-nvm](https://github.com/lukechilds/zsh-nvm)                                |                                       |                            |

### AUR packages

See [General Tips](GENERAL_TIPS.md) on how to install an AUR package or install with `$ makepkg -si`.

| Package Name                                                                     | Description    | Install |
| -------------------------------------------------------------------------------- | -------------- | ------- |
| keybase-bin                                                                      |                |         |
| [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)                           |                |         |
| [oh-my-zsh-git](https://aur.archlinux.org/packages/oh-my-zsh-git/) (Alternative) |                |         |
| visual-studio-code-insiders                                                      |                |         |
| cava                                                                             |                |         |
| [i3lock-color](https://github.com/PandorasFox/i3lock-color)                      |                |         |
| fsearch-git                                                                      |                |         |
| [compton-tryone-git](https://github.com/tryone144/compton)                       |                |         |
| joplin                                                                           | Notetaking app |         |

### Configuration

Please check that these files are setup correctly for your machine as they may differ.

- .Xresources (dpi)
- .config/i3status (not using correct labels)
