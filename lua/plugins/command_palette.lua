return {
    'AtleSkaanes/command-palette.nvim',
    name = 'command-palette',
    event = { 'VeryLazy' },
    config = function(_, opts)
        local cmd_palette = require('command-palette')
        cmd_palette.setup(opts)

        vim.keymap.set('n', '<leader>c1', function() cmd_palette.run_cmd.by_name('Test') end)
        vim.keymap.set('n', '<leader>c2', function() cmd_palette.run_cmd.by_name('TestTable') end)
        vim.keymap.set('n', '<leader>c3', function() cmd_palette.run_cmd.by_name('TestFunc') end)
    end,
    opts = {
        commands = {
            {
                name = 'Test',
                category = 'HUlo',
                cmd = 'C:\\Users\\chris\\AppData\\Local\\nvim-data\\dev_plugins\\command-palette\\test\\program\\hello_world.exe',
            },
            {
                name = 'TestTable',
                cmd = {
                    'clang',
                },
            },
            {
                name = 'TestFunc',
                cmd = function()
                    local out = 'clang '
                    return out .. vim.fn.input({ prompt = 'What do you want?!' })
                end,
            },
        },

        icons = {
            category = 'folder: ',
            cmd = 'cmd: ',
            back = '<-..',
        },
    },
}
