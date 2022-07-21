vim.opt.termguicolors = true

vim.cmd("colorscheme nordfox")

require('lualine').setup {
    options = { theme  = "nordfox" },
}
