" Call Plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'       " Plugin Manager
Plug 'junegunn/gv.vim'         " a git commit browser
Plug 'junegunn/goyo.vim'       " distractioness vim
Plug 'junegunn/seoul256.vim'   " vim colorscheme
Plug 'junegunn/fzf.vim'        " fuzzy finder vim integration
Plug 'junegunn/vim-easy-align' " align
Plug 'tpope/vim-fugitive'      " git in vim
Plug 'tpope/vim-commentary'    " comment out lines
Plug 'tpope/vim-surround'      " change/add surroudings
" 
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'jalvesaq/Nvim-R'
Plug 'gaalcaras/ncm-R'
Plug 'vimwiki/vimwiki'
call plug#end()

let maplocalleader = ","
let mapleader = ","

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" set global settings
set number
set ruler
set nocompatible
filetype plugin on
syntax on
set showcmd             " show (partial) command in status line

" Search down into subfolders
" Provides tab-complettion for all file-related tasks
set path+=**

" More natural split openings
set splitright
set splitbelow

" set seoul256 background color
colo seoul256

"Automatically opens up explorer at the side
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab

" configure editor with tabs and nice stuff...
set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a newline

" make backspaces more powerfull
set backspace=indent,eol,start
