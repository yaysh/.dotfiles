require("nvim-tree").setup({
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    git = {
        ignore = false,
    },
    view = {
        adaptive_size = true
    }
})
