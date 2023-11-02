local dapui = require('dapui')
local dap = require('dap')

dapui.setup()
--- Keybinds
vim.keymap.set('n', '<F5>', function() dap.continue() end)
vim.keymap.set('n', '<F10>', function() dap.step_over() end)
vim.keymap.set('n', '<F9>', function() dap.step_into() end)
vim.keymap.set('n', '<F12>', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>db', function() dap.toggle_breakpoint() end)
vim.keymap.set(
    'n',
    '<Leader>lp',
    function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end
)
vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)
vim.keymap.set(
    { 'n', 'v' },
    '<Leader>dh',
    function() require('dap.ui.widgets').hover() end
)

-- Open Dapui automaticly
dap.listeners.before.event_initialized['dapui_configs'] = function()
    dapui.open()
end
dap.listeners.before.event_terminated['dapui_configs'] = function()
    dapui.close()
end
dap.listeners.before.event_exited['dapui_configs'] = function() dapui.close() end

--- configurations and adapters
-- Update this path
local extension_path =
    'C:/Users/chris/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb'
local this_os = vim.loop.os_uname().sysname

-- The path in windows is different
if this_os:find('Windows') then
    codelldb_path = extension_path .. 'adapter/codelldb.exe'
    liblldb_path = extension_path .. 'lldb/bin/liblldb.dll'
else
    -- The liblldb extension is .so for linux and .dylib for macOS
    liblldb_path = liblldb_path .. (this_os == 'Linux' and '.so' or '.dylib')
end

dap.adapters.codelldb = {
    type = 'server',
    port = '${port}',
    host = '127.0.0.1',
    executable = {
        command = codelldb_path,
        args = { '--liblldb', liblldb_path, '--port', '${port}' },

        detached = false,
    },
}

dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'codelldb',
        request = 'launch',
        program = function()
            return vim.fn.input(
                'Path to executable: ',
                vim.fn.getcwd() .. '/',
                'file'
            )
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
    },
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
