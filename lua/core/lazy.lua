require('lazy').setup('plugins', { -- Default overides
    defaults = {
        lazy = true,
    },
    install = {
        colorscheme = {
            'catppuccin',
        },
    },
    dev = {
        path = vim.fn.stdpath('data') .. '/dev_plugins',
        patterns = { 'AtleSkaanes', 'KneeCapStealer' },
        fallback = true,
    },
})
