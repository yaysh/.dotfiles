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
-- Test
-- nmap("<leader>zz", "<cmd> lua require'JVMTestGenerator'.create_file()<CR>")
-- Telescope bindings
nmap("<leader>ff", "<cmd>Telescope find_files<CR>")
nmap("<leader>fg", "<cmd>Telescope live_grep<CR>")
nmap("<leader>fb", " <cmd>Telescope buffers<CR>")
nmap("<leader>fh", "<cmd>Telescope help_tags<CR>")
nmap("<leader><leader>w", "<Plug>(easymotion-bd-w)")
nmap("<leader>L", "<Plug>(easymotion-overwin-line)")

nmap("<leader>bd", ":wa | %bd | e# | bd# | :NvimTreeFindFile | <CR>")

-- Mapping for dap (debugging)
vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '⭐️', texthl = '', linehl = '', numhl = '' })

nmap("<leader>dt", '<cmd>lua require"dap".toggle_breakpoint()<CR>')
nmap("<leader>dq", '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
nmap("<leader>dc", '<Cmd>lua require"dap".continue()<CR>')
nmap("<leader>dso", '<Cmd>lua require"dap".step_over()<CR>')
nmap("<leader>dsd", '<Cmd>lua require"dap".down()<CR>')
nmap("<leader>dsi", '<Cmd>lua require"dap".step_into()<CR>')
nmap("<leader>dr", '<Cmd>lua require"dap".repl.open()<CR>')
nmap("<leader>dl", '<Cmd>lua require"dap".run_last()<CR>')
nmap("<leader>dk", '<Cmd>lua require"dap.ui.widgets".hover()<CR>')
nmap("<leader>dC", '<Cmd>lua require"dap".terminate()<CR>')
nmap("<leader>dui", '<cmd>lua require"dapui".toggle()<CR>')
-- nmap("<leader>qw", '<cmd>:%bd | e# | bd# | normal `\"<CR>')
nmap("<leader>qw",
    ':lua for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do if vim.bo[bufnr].filetype ~= "NvimTree" and bufnr ~= vim.fn.bufnr("%") then vim.api.nvim_buf_delete(bufnr, {}) end end<CR>')
-- LAZYGIT
nmap("<leader>lg", ':LazyGit<CR>')

-- NvimTree
nmap("<leader>nn", ":NvimTreeFocus<CR>")
nmap("<leader>nt", ':NvimTreeToggle<CR>')
nmap("<leader>nf", ':NvimTreeFindFile<CR>')

-- Terminal
nmap("<C-p>", ':terminal<CR>')

-- Bufferlines
nmap("L", ":BufferLineCycleNext<CR>")
nmap("H", ":BufferLineCyclePrev<CR>")

-- GIT
nmap("]h", "<cmd>lua require'gitsigns'.next_hunk()<CR>")
nmap("[h", "<cmd>lua require'gitsigns'.prev_hunk()<CR>")

nmap("<leader>hs", "<cmd>lua require'gitsigns'.stage_hunk()<CR>")
nmap("<leader>hr", "<cmd>lua require'gitsigns'.reset_hunk()<CR>")
nmap('<leader>hS', '<cmd>lua require"gitsigns".stage_buffer()<CR>')
nmap('<leader>hu', '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>')
nmap('<leader>hR', '<cmd>lua require"gitsigns".reset_buffer()<CR>')
nmap('<leader>hp', '<cmd>lua require"gitsigns".preview_hunk()<CR>')
nmap('<leader>hb', '<cmd>lua require"gitsigns".blame_line({full=true})<CR>')
nmap('<leader>tb', '<cmd>lua require"gitsigns".toggle_current_line_blame()<CR>')
nmap('<leader>hd', '<cmd>lua require"gitsigns".diffthis()<CR>')
nmap('<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
nmap('<leader>td', '<cmd>lua require"gitsigns".toggle_deleted()<CR>')

nmap("<C-i>", "<C-i>zz")
nmap("<C-o>", "<C-o>zz")
nmap("<C-d>", "<C-d>zz")
nmap("<C-u>", "<C-u>zz")
-- Good yank
-- nmap("<leader>y", '"*y')
-- nmap("<leader>p", '"*p')
-- nmap("<leader>Y", '"+y')
-- nmap("<leader>P", '"+p')
