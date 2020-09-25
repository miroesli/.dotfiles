" See https://github.com/junegunn/vim-plug for more info
call plug#begin()
Plug 'https://github.com/junegunn/vim-plug' " Plugin manager help pages
Plug 'https://github.com/preservim/nerdtree' " Nerdtree folder navigation
Plug 'https://github.com/tpope/vim-sensible' " Sensible configuration
Plug 'https://github.com/itchyny/lightline.vim' " Status line
Plug 'https://github.com/preservim/nerdcommenter' " Commenter
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy search base
Plug 'https://github.com/junegunn/fzf.vim' " Fuzzy search
Plug 'https://github.com/vim-syntastic/syntastic' " Syntax checking
Plug 'https://github.com/tpope/vim-surround' " Parenthesizing made simple
Plug 'https://github.com/frazrepo/vim-rainbow' " Rainbow parentheses
Plug 'https://github.com/mbbill/undotree' " Undotree
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense engine for Vim
call plug#end()
