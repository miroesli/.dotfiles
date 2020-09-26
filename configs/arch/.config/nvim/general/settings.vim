" Nerdtree settings
let NERDTreeShowHidden=1
" Close NERDTree if it is the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 
" Rainbow settings
let g:rainbow_active=1
" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" General settings
syntax enable					" Enable syntax highlighting
syntax on						" Turn syntax 
set encoding=utf-8				" Set the encoding written to file
set tabstop=4					" Set the size of the tab visually
set softtabstop=4               " Set the size of the effective tabs	
set shiftwidth=4				" Set number of spaces to use for each step of autoindent
set number						" Line numbers
set nowrap						" Don't wrap long lines
set ruler						" Show cursor position
set undodir=~/.vim/undodir		" Use a undo directory
set undofile					" Create a file per undo file
set incsearch					" Show results as searching
set hlsearch					" Highlight all search pattern matches
set foldenable					" Folding code blocks
set foldmethod=indent			" Fold based on indentation
set foldlevel=5					" Folder text which is above 5 levels
set smarttab					" Make tabs indent smartly
set smartcase					" Enable smart-case search
set ignorecase					" Ignore case when searching
set autoindent smartindent		" Make indenting smart and auto
set showmatch					" Show matching brace
set visualbell					" Use visual bell (no beeping)
set cursorline					" Highlight current line
set clipboard+=unnamedplus		" Enable copy paste within and outside vim
set showcmd						" Show command
let g:markdown_folding=1		" Enable Markdown Folding
au FileType markdown setlocal foldlevel=2 " Fold after level 2 on markdown