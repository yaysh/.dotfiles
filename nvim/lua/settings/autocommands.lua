vim.api.nvim_create_autocmd('BufWinEnter', {
    pattern = { "*.ts", "*.js" },
    command = ":Coverage"
})


vim.api.nvim_create_autocmd('BufWinEnter', {
    pattern = { "*.tsx", "*.jsx" },
    command = "call timer_start(500, { tid -> execute(':Coverage')})"
})


vim.api.nvim_create_autocmd('BufWrite', {
    pattern = "*",
    command = ":lua vim.lsp.buf.format { async = false }"
})
