" Vim 8 defalts
silent! source $VIMRUNTIME/defaults.vim


" Call Plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'       " Plugin Manager
Plug 'junegunn/gv.vim'         " a git commit browser
Plug 'junegunn/goyo.vim'       " distractioness vim
Plug 'junegunn/seoul256.vim'   " vim colorscheme
Plug 'junegunn/fzf.vim'        " fuzzy finder vim integration
Plug 'junegunn/vim-easy-align' " align
    vmap <Enter> <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
Plug 'tpope/vim-fugitive'      " git in vim
Plug 'tpope/vim-commentary'    " comment out lines
Plug 'tpope/vim-surround'      " change/add surroudings
Plug 'jpalardy/vim-slime'      " send code to tmux or other buffer
    let g:slime_target = "vimterminal"
Plug 'vimwiki/vimwiki'
Plug 'michal-h21/vim-zettel' 
    let g:vimwiki_list = [
                \{'name':'zettelkasten', 'path': '~/Dropbox/zettel', 'auto_tags': 1,
                \ 'auto_toc': 1, 'syntax': 'markdown', 'ext': '.md'}
                \]
    let g:vimwiki_use_mouse = 1
Plug 'jalvesaq/Nvim-R'
Plug 'sirver/UltiSnips'
call plug#end()

packadd! matchit
let g:seoul256_background = 239
let g:seoul256_srgb = 1
colo seoul256

" Mappings
" ---------------------------
" use jk to get of insert mode
inoremap jk <esc>
xnoremap jk <esc>
" inoremap <esc> <nop>
let maplocalleader = ","
let mapleader = ","
nnoremap <leader>zn :ZettelNew<space>
" nnoremap <leader>zg :ZettelGenerateLinks

" set global settings alongside defaults
set relativenumber
set smartindent
set incsearch
set ignorecase

" Search down into subfolders
set path+=**

" More natural split openings
set splitright
set splitbelow

"Automatically opens up explorer at the side
let g:netrw_liststyle = 3
let g:netrw_banner = 0

set expandtab                  " enter spaces when tab is pressed
set textwidth=120              " break lines when line length increases
set tabstop=4                  " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4               " number of spaces to use for auto indent
set autoindent                 " copy indent from current line when starting a newline
set backspace=indent,eol,start " make backspaces more powerfull

" source the vimc file after saving it
" if has("autocmd")
    " autocmd bufwritepost .vimrc source $MYVIMRC
" endif
