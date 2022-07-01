let mapleader = " "
" let mapleader = "\<Space>"
" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'scalameta/nvim-metals'
Plug 'preservim/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'mfussenegger/nvim-dap'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'easymotion/vim-easymotion'
Plug 'navarasu/onedark.nvim'
Plug 'tpope/vim-fugitive'
Plug 'hrsh7th/nvim-compe'
Plug 'mfussenegger/nvim-dap'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()


set number relativenumber
syntax on
set t_Co=256
set cursorline
colorscheme onedark
let g:airline_theme='onedark'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" lightline
let g:lightline = { 'colorscheme': 'gruvbox' }

" Telescope bindings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader><leader>w <Plug>(easymotion-bd-w)
nnoremap <leader>L <Plug>(easymotion-overwin-line)
" Scala metals 
nnoremap <leader>gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <leader>gf <cmd>lua vim.lsp.buf.implementation()<cr>

" Mapping for dap (debugging)
nnoremap <silent> <F9> <cmd>lua require'dap'.toggle_breakpoint()<cr>
nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> <Cmd>lua require'dap'.step_out()<CR>

" Neovim compe setup 
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Used for nerd commenter
filetype plugin on

" Autoformating

