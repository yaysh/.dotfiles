-- Install packer
require('plugins')

-- Colors before setup
-- require('colors/catpuccin')
require('colors/nightfox')

-- All configurations for plugins
require('plugins/configs/cmp')
require('plugins/configs/dap-ui')
require('plugins/configs/lsp-installer')
require('plugins/configs/metals-lsp')
require('plugins/configs/nvim-tree')
require('plugins/configs/bufferline')

-- All settings
require('settings/options')
require('settings/keymaps')

