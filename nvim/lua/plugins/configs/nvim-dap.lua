local dap = require('dap')

-- dap.adapters.codelldb = {
--     type = 'server',
--     host = '127.0.0.1',
--     port = 13000
-- }

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = '/home/jens/.local/share/nvim/mason/bin/codelldb',
        args = { "--port", "${port}" },
    }
}

dap.configurations.rust = {
    {
        type = 'codelldb',
        request = 'launch',
        program = function()
            vim.fn.jobstart('cargo build')
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
        end,
        cwd = '${workspaceFolder}',
        terminal = 'integrated',
        sourceLanguages = { 'rust' },
        showDisassembly = "never"
    }
}
