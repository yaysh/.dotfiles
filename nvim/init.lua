-- Install packer
require('plugins')
require('settings/options')
-- Colors before setup
-- require('colors/catpuccin')
-- require('colors/nightfox')
require('colors/everforest')

-- All configurations for plugins
require('plugins/configs/cmp')
require('plugins/configs/dap-ui')
require('plugins/configs/mason')
require('plugins/configs/lsp-config')
require('plugins/configs/metals-lsp')
require('plugins/configs/nvim-tree')
require('plugins/configs/bufferline')
require('plugins/configs/transparent')
require('plugins/configs/nvim-colorizer')
require('plugins/configs/luasnip')

-- All settings
require('settings/keymaps')

