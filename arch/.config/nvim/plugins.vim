" =======================================================
"
" Plugins
" See https://github.com/junegunn/vim-plug for more info
"
" =======================================================

call plug#begin()
Plug 'https://github.com/junegunn/vim-plug' " Plugin manager help pages
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy search base
Plug 'https://github.com/junegunn/fzf.vim' " Fuzzy search
Plug 'https://github.com/preservim/nerdtree', { 'on':  'NERDTreeToggle' } " Nerdtree folder navigation
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin' " Nerdtree git status
Plug 'https://github.com/ryanoasis/vim-devicons' " File type icons 
Plug 'https://github.com/preservim/nerdcommenter' " Commenter
Plug 'https://github.com/tpope/vim-obsession' " Session management
Plug 'https://github.com/tpope/vim-eunuch' " UNIX shell commands
Plug 'https://github.com/tpope/vim-sensible' " Sensible configuration
Plug 'https://github.com/tpope/vim-surround' " Parenthesizing made simple
" Plug 'https://github.com/jiangmiao/auto-pairs' " Auto pair parenthesizing
Plug 'https://github.com/mbbill/undotree' " Undotree
Plug 'https://github.com/itchyny/lightline.vim' " Status line
Plug 'https://github.com/airblade/vim-gitgutter' " Git diff in sign column
Plug 'https://github.com/frazrepo/vim-rainbow' " Rainbow parentheses 
Plug 'https://github.com/norcalli/nvim-colorizer.lua' " Color highlighter
Plug 'https://github.com/iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " Markdown preview
Plug 'https://github.com/mzlogin/vim-markdown-toc' " Generate TOC
Plug 'https://github.com/godlygeek/tabular' " Align text
" Plug 'https://github.com/plasticboy/vim-markdown' " Vim markdown highlighting, syntax and rules
Plug 'https://github.com/sheerun/vim-polyglot' " On demand language pack
Plug 'https://github.com/dkarter/bullets.vim' " Markdown automated bullets and numbering
Plug 'https://github.com/morhetz/gruvbox' " Gruvbox theme 
call plug#end()

" Settings

let g:rainbow_active = 1
lua require'colorizer'.setup()
let NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close NERDTree if it is the only window left
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1 " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_java = 1 " Set a language to use its alternate delimiters by default
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } } " Add your own custom formats or override the defaults
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
let g:NERDToggleCheckAllLines = 1 " Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
set conceallevel=3 " increase conceal level 0->3 so brackets are concealed
let g:fzf_layout = { 'down': '30%' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Shortcuts

nnoremap <silent> <leader>n :NERDTreeToggle<CR>
" nmap <C-b> :CocCommand explorer<CR>
noremap <F5> :UndotreeToggle<CR> :UndotreeFocus<CR>
nnoremap <silent> <Leader>p :FZF<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nmap <C-_> <leader>c<Space>
vmap <C-_> <leader>c<Space>
" noremap <C-_> :Commentary<CR> 
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>:q!<CR>
" start terminal in insert mode
" au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on \+t
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <silent> <leader>t :call OpenTerminal()<CR>i
