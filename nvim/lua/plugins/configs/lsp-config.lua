local function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
    map("n", shortcut, command)
end

local function inoremap(shortcut, command)
    map("i", shortcut, command)
end

local on_attach = function(client, bufnr)
    -- LSP
    nmap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
    nmap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
    nmap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
    nmap("gr", "<cmd>lua vim.lsp.buf.references()<CR>")
    nmap("gwd", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
    nmap("gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
    nmap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
    nmap("<leader>fo", "<cmd>lua vim.lsp.buf.format({ async = false })<CR>")
    nmap("<leader>k", "<cmd>lua vim.lsp.buf.code_action()<CR>")
    nmap("<leader>a", "<cmd>lua vim.diagnostic.setqflist()<CR>")
    nmap("]]", "<cmd>lua vim.diagnostic.goto_prev { wrap = false }<CR>")
    nmap("[[", "<cmd>lua vim.diagnostic.goto_next { wrap = false }<CR>")
    nmap("<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
    nmap('<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder<CR>')
    nmap('<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder<CR>')
    nmap('<leader>D', '<cmd>lua vim.lsp.buf.type_definition<CR>')
end

local lsp_flags = {
    debounce_text_changes = 150,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('lspconfig')['tsserver'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags
}

require('lspconfig').elixirls.setup {
    cmd = { "elixir-ls" },
    on_attach = on_attach,
    capabilities = capabilities
}

require('lspconfig')['svelte'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags,
    filetypes = { "svelte", "html" }
}
require('lspconfig')['tailwindcss'].setup {
    on_attach = on_attach,
    flags = lsp_flags
}

require('lspconfig')['rust_analyzer'].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
            checkOnSave = {
                command = "clippy"
            }
        }
    }
}
require('lspconfig')['html'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities
}

require('lspconfig')['lua_ls'].setup {
    on_attach = on_attach,
    flags = lsp_flags
}
