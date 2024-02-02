call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'https://tpope.io/vim/commentary.git'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'ThePrimeagen/vim-be-good'

call plug#end()

scriptencoding utf-8
set encoding=utf-8
set fileencoding=utf-8

set background=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = 0
colorscheme gruvbox

let mapleader = " "
" Disable leader timeout
set notimeout
set ttimeout

set nobackup
set nowritebackup
set autoindent
set smartindent
set autoread

set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set number
set relativenumber
set title
set showcmd
set cmdheight=1
set laststatus=2
set cursorline
set splitbelow
set splitright
set scrolloff=10
set ignorecase
set breakindent
set wrap
set mouse=a
set nofixeol

:set backspace=indent,eol,start
set path+=**

" Auto-reload changed files
autocmd FocusGained,BufEnter * if mode() != 'c' | checktime | endif

set autowrite
set hidden

set wildmenu
set wildoptions=pum
set termguicolors

" Navigate tabs
map <C-h> gT
map <C-l> gt

" Move text around
vmap J :m '>+1<CR>gv=gv
vmap K :m '<-2<CR>gv=gv

" Replace selection without yank
xmap <Leader>r "_dP

" Shortcuts for copy/paste clipboard
map <Leader>y "+y
map <Leader>Y "+Y
map <Leader>p "+p
map <Leader>P "+P

" Split window
nmap <silent> ss :split<Return>
nmap <silent> sv :vsplit<Return>

" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

nmap <Leader>ff <cmd>Telescope find_files<cr>
nmap <Leader>fg <cmd>Telescope live_grep<cr>
