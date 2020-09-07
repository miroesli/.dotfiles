# Archlinux

<!--![archlinux](./images/archlinux.jpg)-->

## About

OS: [archlinux](https://archlinux.org/)\
WM: [i3wm](https://i3wm.org)\
Terminal: [alacritty](https://github.com/alacritty/alacritty)\
File manager:[ranger](https://ranger.github.io)\
Web browser: [firefox](https://www.archlinux.org/packages/extra/x86_64/firefox/)\
Lockscreen: [lightdm](https://www.archlinux.org/packages/extra/x86_64/lightdm/)\
Wallpaper: None

<!--## Tools in Screenshot

- htop - Resource usage viewer
- neofetch - CLI system info viewer
- cava - sound visualizer
- tty-clock
- ranger - file browser
-->

## Installation

Clone the repo

```sh
cd ~ && git clone git@github.com:miroesli/dotfiles.git
```

Install using the script 

**Warning: This will overwrite your existing config currently**

`[./install](./install)`

## Apps

- Steam - games
- Communication
  - Signal
  - Discord
  - Slack
- Firefox - browser
- Neovim - text editor
- Glances - system monitor
- Xreader - pdfs

## Languages

- Go
- Python

## Fonts

- ttf-meslo-nerd-font-powerlevel10k
- All noto-fonts
  - noto-fonts
  - noto-fonts-cjk
  - noto-fonts-emoji
  - noto-fonts
- siji-git
- bdf-unifont

## Todo

- [ ] Rename this config from `arch` to something more creative
- [ ] Setup global fonts config with something like `fonts-conf`
- [ ] Setup `neovim` plugins and `~/.vimrc` file
- [ ] Get graphical file manager like nautilus or thunar
- [ ] Setup `i3lock`
- [ ] Use `vi` in alacritty
- [ ] Fix dmenu configuration
- [ ] Setup `rofi` menus
- [ ] Add background
- [ ] Setup global colouring
- [ ] Fix keyboard not typing on start terminal for ~2s if no display maanger set
- [ ] xhci-hcd hc dies on reboot
- [ ] `Zsh` color in linux terminal before startup (startx)
- [ ] Change `i3` keybinds to `vi` navigation
- [x] Consider using `polybar` instead of `i3bar`
- [ ] Consider using `rofi` instead of `dmenu`
- [ ] Add `gitconfig`
  - [ ] Set the core.autocrlf, merge.tool and core.editor configs
  - [ ] Update the git aliases in `.zshrc` to the [git method](https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases)
  - [ ] Setup better diff command default for git diff
- [ ] Examine [terminal optimizations](https://dev.to/22mahmoud/my-terminal-became-more-rusty-4g8l) 
- [ ] Setup vi usage within terminal command
- [ ] Create `~/.xsession` file for  setting background and other i3 stuff (see `man i3`)
- [ ] Fix firefox css not working for config/theme/preferences page
- [ ] Get compositor for transparency for polybar such as picom
  - [ ] Fix picom lagging steam games
- [ ] Add `vifm` configs
- [ ] Add `joplin` configs
- [ ] Add `ranger` configs
