local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "      -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
    -- avoids callbacks, used by other plugins
    'nvim-lua/plenary.nvim',
    -- popup for other plugins
    'nvim-lua/popup.nvim',
    -- language parsing completion engine
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-context',
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- language server protocol implementation
    'neovim/nvim-lspconfig',

    -- Themes
    'sainnhe/everforest',
    "ellisonleao/gruvbox.nvim",
    "catppuccin/nvim",
    "EdenEast/nightfox.nvim",
    'Shatur/neovim-ayu',
    'projekt0n/github-nvim-theme',
    'navarasu/onedark.nvim',

    -- Git
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
    },
    -- 'vim-airline/vim-airline'
    -- 'vim-airline/vim-airline-themes'
    'airblade/vim-gitgutter',
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").load_extension("lazygit")
        end,
    },

    -- Scala metals (or needed for it)
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "scalameta/nvim-metals",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-vsnip" },
            { "hrsh7th/vim-vsnip" },
        },
    },
    'rcarriga/nvim-dap-ui',

    -- A little feel good
    'preservim/nerdcommenter',
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = {
            'kyazdani42/nvim-web-devicons', -- lazyional, for file icons
        }
    },
    'easymotion/vim-easymotion',
    'tpope/vim-surround',
    'tpope/vim-commentary',
    'tpope/vim-sensible',
    'norcalli/nvim-colorizer.lua',
    { 'akinsho/bufferline.nvim', version = "v2.*", dependencies = 'kyazdani42/nvim-web-devicons' },
    'xiyaowong/nvim-transparent',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    {
        'folke/todo-comments.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
    }
})
