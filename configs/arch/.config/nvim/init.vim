" Where to look for scripts and docs
set runtimepath^=~/.vim runtimepath+=~/.vim/after 
let &packpath = &runtimepath
" Install vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Initialize configs
source ~/.vimrc
source ~/.config/nvim/general/settings.vim
source ~/.config/nvim/general/shortcuts.vim
source ~/.config/nvim/plugins/plugins.vim
source ~/.config/nvim/plugins/settings.vim
source ~/.config/nvim/themes/theme.vim
