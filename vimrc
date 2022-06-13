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
    Plug 'tpope/vim-commentary'
    Plug 'machakann/vim-sandwich'
    Plug 'tpope/vim-dispatch'
    Plug 'axvr/zepl.vim'
    let g:repl_config = { 'r': {'cmd':'R'} }
    nmap <c-c> gz
    nmap <c-c><c-c> gzap}
call plug#end()

colorscheme peachpuff
map Q <C-w>c
inoremap <F3> %>%
let r_syntax_fun_pattern = 1
packadd! matchit
augroup psql
    autocmd!
    autocmd FileType sql setlocal filetype=pgsql
    autocmd FileType pgsql setlocal formatprg=pg_format\ -
augroup END

highlight TrailingWhitespace ctermbg=magenta
call matchadd("TrailingWhitespace", '\v\s+$')

set nowrap lazyredraw incsearch ignorecase splitright splitbelow
set dir=~/tmp
set conceallevel=2
set tags=./tags;/
set path+=**
set wildignore+=.git/**
set expandtab        " enter spaces when tab is pressed
set textwidth=80    " break lines when line length increases
set softtabstop=4
set shiftwidth=4     " number of spaces to use for auto indent
set autoindent       " copy indent from current line when starting a newline
set regexpengine=2   " set the default regexp engine (mac will freeze up with default)
