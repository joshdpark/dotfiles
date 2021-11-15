" Vim 8 defaults
silent! source $VIMRUNTIME/defaults.vim

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Call Plugins
call plug#begin('~/.vim/plugged')
    Plug 'junegunn/vim-plug'
    Plug 'junegunn/fzf'
    Plug 'junegunn/vim-easy-align' 
        vmap <Enter> <Plug>(EasyAlign)
        nmap ga <Plug>(EasyAlign)
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-dispatch'
    Plug 'jpalardy/vim-slime'
        let g:slime_no_mappings = 1
        nmap <F4> <Plug>SlimeMotionSend
        xmap <F4> <Plug>SlimeRegionSend
        nmap <F4><F4> <Plug>SlimeParagraphSend
    Plug 'vimwiki/vimwiki'
    Plug 'JuliaEditorSupport/julia-vim'
    Plug '18alantom/zettel.vim'
call plug#end()

colorscheme peachpuff
map Q <C-w>c
packadd! matchit
augroup psql
    autocmd!
    autocmd FileType sql setlocal filetype=pgsql
    autocmd FileType pgsql setlocal formatprg=pg_format\ -
augroup END

set conceallevel=2
" set global settings alongside defaults
set number relativenumber
" switch back and forth between relative and norelative depending on focus
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set lazyredraw
set incsearch
set ignorecase
set tags=./tags;/
set path+=**
set wildignore+=.git/**
set splitright
set splitbelow
set expandtab                  " enter spaces when tab is pressed
set textwidth=80               " break lines when line length increases
set softtabstop=4
set shiftwidth=4               " number of spaces to use for auto indent
set autoindent                 " copy indent from current line when starting a newline
