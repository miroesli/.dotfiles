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

```sh
./install.sh
```

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

## Packages

[PACKAGES.md](./PACKAGES.md)

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

- [x] Rename this config from `arch` to something more creative
- [ ] Create better install process with backup current config before overwritting like [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh/blob/master/tools/install.sh) installation.	
  - [ ] Add dotfiles to usb to be able to setup machine with shortcuts
  - [ ] Install necessary packages when running dotfiles install
  - [ ] add selective install
  - [ ] Add section to install the packages I have
  - [ ] Install vim plugins used so that no additional installation is needed
  - [ ] Add setting up firefox config
  - [ ] Examine adding firefox extensions through yay instead
- [ ] Figure out why picom is crashing i3status when restarting with `Mod+Shift+r`
- [ ] Take a look at [tridactyl](https://github.com/tridactyl/tridactyl), [vim-vixen](https://github.com/ueokande/vim-vixen), [vimium](https://github.com/philc/vimium), [surfingkeys](https://github.com/brookhong/Surfingkeys#switch-tabs) and [firenvim](https://github.com/glacambre/firenvim) for better firefox navigation.
- [ ] Add docs for setting up secure firefox as shown on [Restore Privacy Website](https://restoreprivacy.com/firefox-privacy/) 
- [ ] Setup global fonts config with something like `fonts-conf`
- [x] Setup `neovim` plugins and `~/.vimrc` file
- [ ] Get graphical file manager like nautilus or thunar
  - [ ] get a dark theme
- [ ] Setup `i3lock`
- [x] Use `vi` in alacritty
- [ ] Fix dmenu configuration
- [ ] Setup `rofi` menus
- [x] Add background
- [ ] Setup global colouring
- [ ] Fix keyboard not typing on start terminal for ~2s if no display maanger set
- [ ] xhci-hcd hc dies on reboot
- [ ] `Zsh` color in linux terminal before startup (startx)
- [ ] Change `i3` keybinds to `vi` navigation
- [x] Consider using `polybar` instead of `i3bar`
- [ ] Consider using `rofi` instead of `dmenu`
- [x] Add `gitconfig`
  - [ ] Set the core.autocrlf, merge.tool (see existing tools using `git mergetool --tool-help`) and core.editor configs 
  - [x] Update the git aliases in `.zshrc` to the [git method](https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases)
  - [ ] Setup better diff command default for git diff
- [ ] Examine [terminal optimizations](https://dev.to/22mahmoud/my-terminal-became-more-rusty-4g8l) 
- [ ] Setup vi usage within terminal command
- [ ] Create `~/.xsession` file for  setting background and other i3 stuff (see `man i3`)
- [ ] Fix firefox css not working for config/theme/preferences page
- [ ] Get compositor for transparency for polybar such as picom
  - [ ] Fix picom lagging steam games
- [ ] Add `vifm` configs
- [x] Add `joplin` configs
- [ ] Add `ranger` configs
- [ ] Add additional configurations to nvim
  - [ ] Read [Ultimate vimrc](https://github.com/amix/vimrc)
  - [ ] Read `:help options` in nvim
  - [ ] Check out [command-t](https://github.com/wincent/command-t)
  - [ ] Add [YCM](https://github.com/ycm-core/YouCompleteMe#installation)
  - [ ] Check out [ncm2 alternative to YCM](https://github.com/ncm2/ncm2)
  - [ ] Check out [vim-peekaboo](https://github.com/junegunn/vim-peekaboo)
  - [ ] Check out [vim-test](https://github.com/junegunn/vim-peekaboo)
  - [ ] Check out [coc.vim](https://github.com/neoclide/coc.nvim)
	  - [ ] Look at coc plugins such as `coc-explorer` and `coc-prettier`
  - [ ] Compare [vim-commentary](https://github.com/tpope/vim-commentary) with nerdcommenter
  - [ ] Check out [vim-fugitive](https://github.com/tpope/vim-fugitive)
  - [ ] Check out [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
  - [ ] Check out [vim-eunuch](https://github.com/tpope/vim-eunuch)
  - [ ] Check out [ale](https://github.com/dense-analysis/ale)
  - [ ] Check out [vim-easymotion](https://github.com/easymotion/vim-easymotion)
  - [ ] Check out [deoplete.nvim](https://github.com/Shougo/deoplete.nvim)
  - [ ] Check out [moving current window between tabs](https://vim.fandom.com/wiki/Move_current_window_between_tabs)
  - [ ] Check out [tabnine](https://github.com/codota/TabNine)-[vim](https://github.com/codota/tabnine-vim)
  - [ ] Check out [syntastic](https://github.com/vim-syntastic/syntastic)
  - [ ] Check out [vim-session](https://github.com/xolox/vim-session)
  - [ ] Check out [vim-workspace](https://github.com/thaerkh/vim-workspace)
  - [ ] Focus nerdtree if already open and not focused when open shortcut is used
- [ ] Fix opening saved vim session when nerd tree was open. eg `nvim -S path/to/mks/file.vim`
- [x] Add space after comment for `nerdcommenter`
- [ ] Add [fzf](https://github.com/junegunn/fzf) fuzzy filtering for app search through rofi and dmenu
