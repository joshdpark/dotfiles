call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'junegunn/seoul256.vim'
call plug#end()

set number
colo seoul256

"Automatically opens up explorer at the side
autocmd vimenter * 10Vexplore
let g:netrw_liststyle = 3
let g:netrw_banner = 0
