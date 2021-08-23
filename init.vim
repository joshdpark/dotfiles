let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
call plug#begin('~/.vim/plugged')
    Plug 'neovim/nvim-lspconfig'
    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
    Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
    Plug 'nvim-lua/plenary.nvim'
    Plug 'kassio/neoterm'
    Plug 'Shatur/neovim-ayu'

    Plug 'junegunn/vim-plug' 
    Plug 'junegunn/gv.vim'    
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'    
        let g:fzf_tags_command = 'ctags -R'
        let g:fzf_layout = { 'down': '40%' }
        let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
    Plug 'junegunn/vim-easy-align'
        vmap <Enter> <Plug>(EasyAlign)
        nmap ga <Plug>(EasyAlign)
    Plug 'junegunn/vim-peekaboo'

    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-dadbod'
    Plug 'kristijanhusak/vim-dadbod-ui'
    Plug 'tpope/vim-dispatch'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'JuliaEditorSupport/julia-vim'
        let g:latex_to_unicode_auto = 1
    Plug 'lervag/vimtex'
        let g:tex_flavor = 'latex'
        let g:vimtex_view_method='zathura'
        let g:vimtex_quickfix_mode=0
        let g:tex_conceal='abdmg'
        let g:vimtex_compiler_method = 'tectonic'
    Plug 'vimwiki/vimwiki'
    Plug 'michal-h21/vim-zettel' 
        let g:vimwiki_list = [{'path':'~/sync/zettel/', 'auto_tags': 1, 'auto_toc': 1, 'syntax': 'markdown', 'ext': '.md'}]
        let g:vimwiki_use_mouse = 1
        let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always"
    Plug 'skywind3000/asyncrun.vim'
    Plug 'mattn/emmet-vim'
    Plug 'norcalli/nvim-colorizer.lua'
call plug#end()
packadd termdebug

if has('termguicolors')
    set termguicolors
    set background=light
    colorscheme ayu
endif

let maplocalleader=","
let mapleader=","
tnoremap <C-Space> <C-\><C-n>
nnoremap <F4><F4> :TREPLSendLine<CR>
nmap <F4> <Plug>(neoterm-repl-send)
vnoremap <F4> :TREPLSendSelection<CR>
map Q <C-w>c
autocmd FileType r setlocal shiftwidth=2 tabstop=2 softtabstop=2 " R shift to two spaces

set conceallevel=1
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set lazyredraw
set undofile
set incsearch
set scrolloff=5

set path+=**                     " Search down into subfolders
set splitright                   " More natural split openings
set splitbelow
let g:netrw_liststyle = 3        " Automatically opens up explorer at the side
let g:netrw_banner = 0
set smartindent
set expandtab                    " enter spaces when tab is pressed
set textwidth=80                 " break lines when line length increases
set tabstop=4                    " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4                 " number of spaces to use for auto indent

" Lua Configuration
lua <<EOF
require'colorizer'.setup()
require'lspconfig'.pylsp.setup{}
require'lspconfig'.julials.setup{}
require'lspconfig'.r_language_server.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.texlab.setup{}
require'lspconfig'.cssls.setup{}

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "julials", "tsserver", "pylsp", "r_language_server" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

EOF
