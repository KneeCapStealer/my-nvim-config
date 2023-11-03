return {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    main = 'nvim-tree',
    event = { 'VeryLazy' },
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    opts = {},
    init = function()
        -- disable netrw at the very start of your init.lua
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- set termguicolors to enable highlight groups
        vim.opt.termguicolors = true

        vim.keymap.set('n', '<C-o>', '<cmd>NvimTreeToggle<CR>')
    end,
}
