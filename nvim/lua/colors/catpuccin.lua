vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.opt.termguicolors = true
require('lualine').setup {
    options = { theme  = "catppuccin" },
  }
vim.cmd[[colorscheme catppuccin]]
