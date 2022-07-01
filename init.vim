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


" Used for nerd commenter
filetype plugin on

" Autoformating

