# Install ZSH theme

TLDR: Can run [zsh install scrip](../scripts/installZshTheme.sh) to install oh-my-zsh and install the theme

## Install Oh-my-zsh

via curl

sh -c "\$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

via wget

sh -c "\$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## Install powerlevel9k theme

https://github.com/Powerlevel9k/powerlevel9k/wiki/Install-Instructions#option-2-install-for-oh-my-zsh

```bash
$ git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```

## Update ~/.zshrc

```bash
ZSH_THEME="powerlevel9k/powerlevel9k"
```

## Install plugins

git clone https://github.com/zsh-users/zsh-autosuggestions \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-completions \${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
