" Call Plugins
call plug#begin('~/.vim/plugged')
Plug 'jalvesaq/Nvim-R'
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdcommenter'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'gaalcaras/ncm-R'
" Vim 8 only
if !has('nvim')
    Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

" Nvim-R Settings
let maplocalleader = ','

" set global settings
set number
set ruler
set autoindent
syntax on
set showcmd             " show (partial) command in status line

" Search down into subfolders
" Provides tab-complettion for all file-related tasks
set path+=**

" More natural split openings
set splitright
set splitbelow

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" set seoul256 background color
let g:seoul256_background=236
let g:seoul256_srgb = 1
colo seoul256

"Automatically opens up explorer at the side
"autocmd vimenter * 10Vexplore
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
