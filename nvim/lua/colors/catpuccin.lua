vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.cmd [[colorscheme catppuccin]]

require('lualine').setup {
    options = { theme = "catppuccin" }
}

vim.g['transparent_enabled'] = 'v:false'
