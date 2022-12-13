local fn = vim.fn
-- Automatically install packer on initial startup
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    Packer_Bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
    print "---------------------------------------------------------"
    print "Press Enter to install packer and plugins."
    print "After install -- close and reopen Neovim to load configs!"
    print "---------------------------------------------------------"
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand to reload neovim when you save plugins.lua
vim.cmd [[
   augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerSync
   augroup end
]]

-- Use a protected call
local present, packer = pcall(require, "packer")

if not present then
    return
end


-- Install the plugins
packer.startup(function(use)
    -- Code Coverage
    use 'wbthomason/packer.nvim' -- packer manages itself
    use 'nvim-lua/plenary.nvim' -- avoids callbacks, used by other plugins
    use 'nvim-lua/popup.nvim' -- popup for other plugins
    use 'nvim-treesitter/nvim-treesitter' -- language parsing completion engine
    use 'nvim-treesitter/nvim-treesitter-context'
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use 'neovim/nvim-lspconfig' -- language server protocol implementation

    -- Themes
    use 'sainnhe/everforest'
    use 'navarasu/onedark.nvim'
    use { "ellisonleao/gruvbox.nvim" }
    use({
        "catppuccin/nvim",
        as = "catppuccin"
    })
    use "EdenEast/nightfox.nvim"
    use 'Shatur/neovim-ayu'
    use 'projekt0n/github-nvim-theme'

    -- Git
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- use 'vim-airline/vim-airline'
    -- use 'vim-airline/vim-airline-themes'
    use 'airblade/vim-gitgutter'
    use 'tpope/vim-fugitive'

    -- Scala metals (or needed for it)
    use 'nvim-telescope/telescope.nvim'
    use({
        "scalameta/nvim-metals",
        requires = {
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
        },
    })
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-vsnip" },
            { "hrsh7th/vim-vsnip" },
        },
    })
    use 'rcarriga/nvim-dap-ui'

    -- A little feel good
    use 'preservim/nerdcommenter'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        }
    }
    use 'easymotion/vim-easymotion'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'tpope/vim-sensible'
    use 'norcalli/nvim-colorizer.lua'
    use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
    use 'xiyaowong/nvim-transparent'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if Packer_Bootstrap then
        require('packer').sync()
    end
end)
