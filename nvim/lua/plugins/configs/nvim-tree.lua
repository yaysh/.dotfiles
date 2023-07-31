require("nvim-tree").setup({
    auto_reload_on_write = true,
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
