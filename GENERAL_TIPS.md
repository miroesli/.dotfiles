# General Tips

## [Caching Github password in git](https://help.github.com/en/github/using-git/caching-your-github-password-in-git)

1. In Terminal, enter the following:

```bash
$ git config --global credential.helper cache
# Set git to use the credential memory cache
```

2. To change the default password cache timeout, enter the following:

```bash
$ git config --global credential.helper 'cache --timeout=3600'
# Set the cache to timeout after 1 hour (setting is in seconds)
```

## Installing AUR packages with an [AUR helper](https://wiki.archlinux.org/index.php/AUR_helpers)

To install AUR packages, I use `yay` (Yet Another Yogurt).

To install yay, clone with git and generate the package to install.

```bash
$ git clone https://aur.archlinux.org/yay.git
$ cd yay
$ makepkg -si
```
