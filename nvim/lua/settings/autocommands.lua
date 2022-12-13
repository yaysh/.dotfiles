vim.api.nvim_create_autocmd('BufWrite', {
    pattern = "*",
    command = ":lua vim.lsp.buf.format { async = false }"
})
