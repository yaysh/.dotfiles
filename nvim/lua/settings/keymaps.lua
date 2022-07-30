local function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
    map("n", shortcut, command)
end

local function inoremap(shortcut, command)
    map("i", shortcut, command)
end
-- Autocomplete brackets 
inoremap('{<CR>', '{<Cr>}<Esc>ko')
inoremap('(', '()<Esc>ha')
inoremap('[', '[]<Esc>ha')
inoremap('"', '""<Esc>ha')
inoremap("'", "\'\'<Esc>ha")
inoremap('`', '``<Esc>ha')

-- Telescope bindings
nmap("<leader>ff", "<cmd>Telescope find_files<CR>")
nmap("<leader>fg", "<cmd>Telescope live_grep<CR>")
nmap("<leader>fb", " <cmd>Telescope buffers<CR>")
nmap("<leader>fh", "<cmd>Telescope help_tags<CR>")
nmap("<leader><leader>w", "<Plug>(easymotion-bd-w)")
nmap("<leader>L", "<Plug>(easymotion-overwin-line)")

-- LSP
nmap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
nmap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
nmap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
nmap("gr", "<cmd>lua vim.lsp.buf.references()<CR>")
nmap("gwd", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
nmap("gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
nmap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
nmap("<leader>fo", "<cmd>lua vim.lsp.buf.formatting()<CR>")
nmap("<leader>k", "<cmd>lua vim.lsp.buf.code_action()<CR>")
nmap("<leader>ws", '<cmd>lua require"metals".worksheet_hover()<CR>')
nmap("<leader>a", "<cmd>lua vim.diagnostic.setqflist()<CR>")
nmap("[c", "<cmd>lua vim.diagnostic.goto_prev { wrap = false }<CR>")
nmap("]c", "<cmd>lua vim.diagnostic.goto_next { wrap = false }<CR>")
nmap("<leader>mm", '<cmd>lua require"telescope".extensions.metals.commands()<CR>')
nmap("<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>")

-- Mapping for dap (debugging)
nmap("<leader>dt", '<cmd>lua require"dap".toggle_breakpoint()<CR>')
nmap("<leader>dc", '<Cmd>lua require"dap".continue()<CR>')
nmap("<leader>dso", '<Cmd>lua require"dap".step_over()<CR>')
nmap("<leader>dsd", '<Cmd>lua require"dap".down()<CR>')
nmap("<leader>dsi", '<Cmd>lua require"dap".step_into()<CR>')
nmap("<leader>dr", '<Cmd>lua require"dap".repl.open()<CR>')
nmap("<leader>dl", '<Cmd>lua require"dap".run_last()<CR>')
nmap("<leader>dK", '<Cmd>lua require"dap.ui.widgets".hover()<CR>')
nmap("<leader>dC", '<Cmd>lua require"dap".terminate()<CR>')
nmap("<leader>dui", '<cmd>lua require"dapui".toggle()<CR>')

-- NvimTree
nmap("<leader>n", ":NvimTreeFocus<CR>")
nmap("<C-t>", ':NvimTreeToggle<CR>')
nmap("<C-l>", ':NvimTreeFindFile<CR>')

-- Terminal
nmap("<C-p>", ':terminal<CR>')

-- Bufferlines
nmap("L", ":BufferLineCycleNext<CR>")
nmap("H", ":BufferLineCyclePrev<CR>")
