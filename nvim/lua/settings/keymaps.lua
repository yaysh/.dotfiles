local function map(mode, shortcut, command)
 vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
 map("n", shortcut, command)
end

-- Telescope bindings
nmap("<leader>ff", "<cmd>Telescope find_files<CR>")
nmap("<leader>fg", "<cmd>Telescope live_grep<CR>")
nmap("<leader>fb", " <cmd>Telescope buffers<CR>")
nmap("<leader>fh", "<cmd>Telescope help_tags<CR>")
nmap("<leader><leader>w", "<Plug>(easymotion-bd-w)")
nmap("<leader>L", "<Plug>(easymotion-overwin-line)")

-- Scala metals 
nmap("<silent>gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
nmap("<silent>K", "<cmd>lua vim.lsp.buf.hover()<CR>")
nmap("<silent>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
nmap("<silent>gr", "<cmd>lua vim.lsp.buf.references()<CR>")
nmap("<silent>gwd", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
nmap("<silent>gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
nmap("<silent><leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
nmap("<silent><leader>fo", "<cmd>lua vim.lsp.buf.formatting()<CR>")
nmap("<silent><leader>k", "<cmd>lua vim.lsp.buf.code_action()<CR>")
nmap("<silent><leader>ws", '<cmd>lua require"metals".worksheet_hover()<CR>')
nmap("<silent><leader>a", "<cmd>lua vim.diagnostic.setqflist()<CR>")
nmap("<silent>[c", "<cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>")
nmap("<silent>]c", "<cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>")
nmap("<silent><leader>mm", '<cmd>lua require"telescope".extensions.metals.commands()<CR>')

-- Mapping for dap (debugging)
nmap("<silent><leader>dt", '<cmd>lua require"dap".toggle_breakpoint()<CR>')
nmap("<silent><leader>dc", '<Cmd>lua require"dap".continue()<CR>')
nmap("<silent><leader>dso", '<Cmd>lua require"dap".step_over()<CR>')
nmap("<silent><leader>dsd", '<Cmd>lua require"dap".down()<CR>')
nmap("<silent><leader>dsi", '<Cmd>lua require"dap".step_into()<CR>')
nmap("<silent><leader>dr", '<Cmd>lua require"dap".repl.open()<CR>')
nmap("<silent><leader>dl", '<Cmd>lua require"dap".run_last()<CR>')
nmap("<silent><leader>dK", '<Cmd>lua require"dap.ui.widgets".hover()<CR>')
nmap("<silent><leader>dC", '<Cmd>lua require"dap".terminate()<CR>')
nmap("<silent><leader>dui", '<cmd>lua require"dapui".toggle()<CR>')

-- NvimTree
nmap("<leader>n", ":NvimTreeFocus<CR>")
nmap("<C-t>", ':NvimTreeToggle<CR>')

-- Bufferliens
nmap("L", ":BufferLineCycleNext<CR>")
nmap("H", ":BufferLineCyclePrev<CR>")
