return {
    'utilyre/barbecue.nvim',
    lazy = false,
    event = { 'BufWinEnter' },
    tag = '*',
    dependencies = {
        'SmiteshP/nvim-navic',
        'nvim-tree/nvim-web-devicons', -- optional dependency
    },
    opts = {
        create_autocmd = false,
    },
    init = function()
        vim.api.nvim_create_autocmd({
            'WinResized',
            'BufWinEnter',
            'CursorHold',
            'InsertLeave',
        }, {
            group = vim.api.nvim_create_augroup('barbecue.updater', {}),
            callback = function() require('barbecue.ui').update() end,
        })
    end,
}
