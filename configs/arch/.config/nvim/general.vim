"==================
"
" General settings
"
" =================

syntax enable                             " Enable syntax highlighting
syntax on                                 " Turn syntax
filetype plugin indent on				  " Enable filetype plugins and indents
set encoding=UTF-8                        " Set the encoding written to file
set relativenumber                        " Use relative line numbers
set termguicolors                         " Enables 24-bit RGB color in the terminal UI
set tabstop=4                             " Set the size of the tab visually
set softtabstop=4                         " Set the size of the effective tabs
set shiftwidth=4                          " Set number of spaces to use for each step of autoindent
set number                                " Line numbers
set nowrap                                " Don't wrap long lines
set ruler                                 " Show cursor position
set undodir=~/.vim/undodir                " Use a undo directory
set undofile                              " Create a file per undo file
set incsearch                             " Show results as searching
set hlsearch                              " Highlight all search pattern matches
set foldenable                            " Folding code blocks
set foldmethod=indent                     " Fold based on indentation
set foldlevel=5                           " Folder text which is above 5 levels
set smarttab                              " Make tabs indent smartly
set smartcase                             " Enable smart-case search
set ignorecase                            " Ignore case when searching
set autoindent smartindent                " Make indenting smart and auto
set showmatch                             " Show matching brace
set visualbell                            " Use visual bell (no beeping)
set cursorline                            " Highlight current line
set clipboard+=unnamedplus                " Enable copy paste within and outside vim
set showcmd                               " Show command
set completeopt=menuone,noinsert,noselect " Show menu on insert and don't autoselect
set scrolloff=8                           " Default number of lines to keep below and above selection
set spell spelllang=en_us                 " Enable spelling correction
set updatetime=50						  " Update quicker, default is 4000ms
set shortmess+=c						  " Avoid showing message extra message when using completion
let g:markdown_folding=1                  " Enable Markdown Folding
au FileType markdown setlocal foldlevel=2 " Fold after level 2 on markdown

" Shortcuts

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
