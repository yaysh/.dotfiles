
-- Plugins will be downloaded under the specified directory.
local Plug = vim.fn['plug#']
local path = (has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged'
vim.call('plug#begin', path)

--  Themes
Plug 'sainnhe/everforest'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'navarasu/onedark.nvim'
Plug 'morhetz/gruvbox'

-- Git
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

-- Scala metal (or needed for it
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'scalameta/nvim-metals'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'
-- Plug 'akinsho/toggleterm.nvim', {'tag' : 'v1.*'}
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v1.*'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'

vim.call('plug#end()')
