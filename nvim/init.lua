-- Install packer
require('plugins')
require('settings/options')
-- Colors before setup
-- require('colors/catpuccin')
-- require('colors/gruvbox')
require('colors/github')
-- require('colors/nightfox')
-- require('colors/everforest')
-- require('colors/neovim-ayu')
-- require('colors/onedark')

-- All configurations for plugins
require('plugins/configs/cmp')
require('plugins/configs/nvim-dap')
require('plugins/configs/dap-ui')
require('plugins/configs/mason')
require('plugins/configs/lsp-config')
require('plugins/configs/nvim-tree')
require('plugins/configs/nvim-treesitter')
require('plugins/configs/nvim-treesitter-context')
require('plugins/configs/bufferline')
require('plugins/configs/transparent')
require('plugins/configs/nvim-colorizer')
require('plugins/configs/luasnip')
require('plugins/configs/metals-lsp')

-- All settings
require('settings/keymaps')
require('settings/autocommands')
