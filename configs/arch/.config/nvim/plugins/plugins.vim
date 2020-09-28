" See https://github.com/junegunn/vim-plug for more info
call plug#begin()
Plug 'https://github.com/junegunn/vim-plug' " Plugin manager help pages
Plug 'https://github.com/preservim/nerdtree', { 'on':  'NERDTreeToggle' } " Nerdtree folder navigation
Plug 'https://github.com/tpope/vim-sensible' " Sensible configuration
Plug 'https://github.com/itchyny/lightline.vim' " Status line
Plug 'https://github.com/preservim/nerdcommenter' " Commenter
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy search base
Plug 'https://github.com/junegunn/fzf.vim' " Fuzzy search
Plug 'https://github.com/tpope/vim-surround' " Parenthesizing made simple
Plug 'https://github.com/frazrepo/vim-rainbow' " Rainbow parentheses
Plug 'https://github.com/iamcco/markdown-preview.nvim' " Markdown preview
Plug 'https://github.com/dkarter/bullets.vim' " Markdown automated bullets and numbering
Plug 'https://github.com/mbbill/undotree' " Undotree
Plug 'https://github.com/ryanoasis/vim-devicons' " File type icons
Plug 'https://github.com/morhetz/gruvbox' " Gruvbox theme
Plug 'https://github.com/norcalli/nvim-colorizer.lua' " Color highlighter
Plug 'https://github.com/tpope/vim-obsession' " Session management
Plug 'https://github.com/tpope/vim-eunuch' " UNIX shell commands
Plug 'https://github.com/airblade/vim-gitgutter' " Git diff in sign column
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'} " Intellisense engine for Vim
call plug#end()
