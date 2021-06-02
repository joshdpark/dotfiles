let maplocalleader=","
let mapleader=","

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs / https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Call Plugins
call plug#begin('~/.vim/plugged')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
    Plug 'nvim-treesitter/playground'
    Plug 'neovim/nvim-lspconfig' " LSP config
    Plug 'hrsh7th/nvim-compe' " nvim autocompletion
    Plug 'hrsh7th/vim-vsnip' " nvim snippets
    Plug 'rafamadriz/friendly-snippets' " collection of snippets
    Plug 'hkupty/iron.nvim' " repl support
    Plug 'junegunn/vim-plug'       " Plugin Manager
    Plug 'junegunn/gv.vim'         " a git commit browser
    Plug 'junegunn/goyo.vim'       " distractioness vim
    Plug 'junegunn/seoul256.vim'   " vim colorscheme
    Plug 'ayu-theme/ayu-vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'        " fuzzy finder vim integration
        let g:fzf_tags_command = 'ctags -R'
        let g:fzf_layout = { 'down': '40%' }
        let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
    Plug 'junegunn/vim-easy-align' " align
        vmap <Enter> <Plug>(EasyAlign)
        nmap ga <Plug>(EasyAlign)
    Plug 'junegunn/vim-peekaboo'
    Plug 'tpope/vim-fugitive'      " git in vim
    Plug 'tpope/vim-commentary'    " comment out lines
    Plug 'tpope/vim-surround'      " change/add surroudings
    Plug 'JuliaEditorSupport/julia-vim'
        let g:latex_to_unicode_auto = 1
    Plug 'skywind3000/asyncrun.vim'
    Plug 'mattn/emmet-vim'
call plug#end()

if has('termguicolors')
    set termguicolors
    let ayucolor="mirage"
    colorscheme ayu
endif

set conceallevel=1 " vimtex
autocmd FileType python let g:slime_vimterminal_cmd="ipython"
autocmd FileType r setlocal shiftwidth=2 tabstop=2 softtabstop=2 
autocmd FileType r imap <c-m> %>%

set number relativenumber " set global settings alongside defaults
augroup numbertoggle      " switch between relative and norelative depending on focus
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

set expandtab                  " enter spaces when tab is pressed
set textwidth=80               " break lines when line length increases
set tabstop=4                  " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4               " number of spaces to use for auto indent

set completeopt=menuone,noselect " set completion for nvim-compe

" use Q to close out of buffers
map Q <C-w>c

" nvim-compe
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" NOTE: You can use other key to expand snippet.

" vsnip
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'


lua <<EOF
require'nvim-treesitter.configs'.setup {
    -- Modules and its options go here
    highlight = { enable = true },
    incremental_selection = { enable = true },
    textobjects = { enable = true },
    indent = { enable = true }, 
}
require'lspconfig'.pyright.setup{}
require'lspconfig'.julials.setup{}
require'lspconfig'.r_language_server.setup{}
require'lspconfig'.jedi_language_server.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.texlab.setup{}

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
local servers = { "jedi_language_server", "julials", "tsserver", "r_language_server" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
  };
}

local iron = require('iron')

iron.core.add_repl_definitions {
  python = {
    mycustom = {
      command = {"mycmd"}
    }
  },
}

iron.core.set_config {
  preferred = {
    python = "ipython",
  },
  repl_open_cmd = "botright vertical split"
}
EOF

