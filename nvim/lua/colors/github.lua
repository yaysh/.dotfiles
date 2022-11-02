require('github-theme').setup({
    theme_style = "dark_default",
    -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    colors = { hint = "orange", error = "#ff0000" },
})

require('lualine').setup {
    options = { theme = "carbonfox" },
    -- options = { theme = "catppuccin" }
}

vim.g['transparent_enabled'] = 'v:false'
