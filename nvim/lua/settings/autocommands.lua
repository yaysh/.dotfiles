vim.api.nvim_create_autocmd('BufWrite', {
    pattern = "*",
    command = ":lua vim.lsp.buf.format { async = false }"
})
local function open_nvim_tree()
    require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
