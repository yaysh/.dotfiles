local metals_config = require("metals").bare_config()

-- Example of settings
metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
}

-- Example if you are using cmp how to make sure the correct capabilities for snippets are set
local capabilities = vim.lsp.protocol.make_client_capabilities()
metals_config.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Debug settings if you're using nvim-dap
local dap = require("dap")

dap.configurations.scala = {
  {
    type = "scala",
    request = "launch",
    name = "RunOrTest",
    metals = {
      runType = "runOrTestFile",
      --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
    },
  },
  {
    type = "scala",
    request = "launch",
    name = "Test Target",
    metals = {
      runType = "testTarget",
    },
  },
}

local function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
    map("n", shortcut, command)
end

local function inoremap(shortcut, command)
    map("i", shortcut, command)
end
metals_config.on_attach = function(client, bufnr)
  require("metals").setup_dap()

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
    nmap("]]", "<cmd>lua vim.diagnostic.goto_prev { wrap = false }<CR>")
    nmap("[[", "<cmd>lua vim.diagnostic.goto_next { wrap = false }<CR>")
    nmap("<leader>mm", '<cmd>lua require"telescope".extensions.metals.commands()<CR>')
    nmap("<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
end

-- Autocmd that will actually be in charging of starting the whole thing
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
