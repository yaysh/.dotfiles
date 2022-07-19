vim.opt.termguicolors = true
vim.opt.background = "dark"

vim.g['everforest_background'] = "soft"
vim.g['everforest_better_performance'] = 1
vim.g['airline_theme'] = "transparent"
vim.g['airline#extensions#tabline#enabled'] = 0
vim.g['airline_powerline_fonts'] = 1

vim.g.colorscheme = "everforest"
vim.cmd ([[ 
    highlight Normal guibg=none
    highlight NonText guibg=none
    highlight VertSplit ctermbg=NONE
    highlight VertSplit ctermfg=NONE
    hi EndOfBuffer guibg=none ctermbg=none
]])


require('lualine').setup {
    options = { theme  = "everforest" },
  }
