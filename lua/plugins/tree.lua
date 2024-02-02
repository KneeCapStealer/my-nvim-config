return {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    keys = { '<leader>ft' },
    main = 'nvim-tree',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('nvim-tree').setup({
            renderer = {
                special_files = {
                    'Cargo.toml',
                    'Makefile',
                    'README.md',
                    'readme.md',
                    'CMakeLists.txt',
                },
            },
            filters = {
                dotfiles = true,
                custom = {
                    '.\\.exe',
                    '.\\.ilk',
                    '.\\.pdb',
                },
            },
        })
        -- disable netrw at the very start of your init.lua
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- set termguicolors to enable highlight groups
        vim.opt.termguicolors = true

        vim.keymap.set('n', '<leader>ft', '<cmd>NvimTreeToggle<CR>')
    end,
}
