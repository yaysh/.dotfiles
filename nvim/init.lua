-- Install packer
require('plugins')

-- All configurations for plugins
require('plugins/configs/cmp')
require('plugins/configs/dap-ui')
require('plugins/configs/lsp-installer')
require('plugins/configs/metals-lsp')
require('plugins/configs/catpuccin')
require('plugins/configs/nvim-tree')
require('plugins/configs/bufferline')

-- All settings
require('settings/options')
require('settings/keymaps')
require('settings/styles')
