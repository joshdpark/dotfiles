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
    Plug 'junegunn/gv.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
        imap <c-x><c-k> <plug>(fzf-complete-word)
        imap <c-x><c-f> <plug>(fzf-complete-path)
        imap <c-x><c-l> <plug>(fzf-complete-line)
        let g:fzf_tags_command = 'ctags -R'
        let g:fzf_layout = { 'down': '40%' }
        let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
    Plug 'junegunn/vim-easy-align' 
        vmap <Enter> <Plug>(EasyAlign)
        nmap ga <Plug>(EasyAlign)
    Plug 'junegunn/vim-peekaboo'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-dispatch'
    Plug 'jpalardy/vim-slime'
        let g:slime_no_mappings = 1
        nmap <F4> <Plug>SlimeMotionSend
        xmap <F4> <Plug>SlimeRegionSend
        nmap <F4><F4> <Plug>SlimeParagraphSend
    Plug 'lervag/vimtex'
        let g:tex_flavor = 'latex'
        let g:vimtex_view_method='zathura'
        let g:vimtex_quickfix_mode=0
        let g:tex_conceal='abdmg'
        let g:vimtex_compiler_method = 'tectonic'
    Plug 'vimwiki/vimwiki'
    Plug 'michal-h21/vim-zettel' 
        let g:vimwiki_list = [{'auto_tags': 1, 'auto_toc': 1, 'syntax': 'markdown', 'ext': '.md'}]
        let g:vimwiki_use_mouse = 1
        let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always"
    Plug 'skywind3000/asyncrun.vim'
call plug#end()

colorscheme peachpuff
set conceallevel=1 " vimtex
" Mappings
let maplocalleader=","
let mapleader=","
map Q <C-w>c
packadd! matchit
augroup psql
    au!
    au FileType sql setlocal filetype=pgsql
augroup end
augroup rfiles
    au!
    au FileType r imap <M-m> %>%
    au FileType r set makeprg=Rscript
    au FileType r set equalprg=formatr
    au FileType r setlocal shiftwidth=2 tabstop=2 softtabstop=2 
augroup END

" set global settings alongside defaults
set number relativenumber
" switch back and forth between relative and norelative depending on focus
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set lazyredraw
set undofile
set incsearch
set ignorecase
set scrolloff=5
set tags=./tags;/

" Search down into subfolders
set path+=**

" More natural split openings
set splitright
set splitbelow

"Automatically opens up explorer at the side
let g:netrw_liststyle = 3
let g:netrw_banner = 0

set expandtab                  " enter spaces when tab is pressed
set textwidth=80               " break lines when line length increases
set tabstop=4                  " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4               " number of spaces to use for auto indent
set autoindent                 " copy indent from current line when starting a newline
set backspace=indent,eol,start " make backspaces more powerfull

let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
