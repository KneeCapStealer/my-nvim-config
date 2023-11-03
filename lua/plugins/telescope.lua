return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' },
    init = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>of', builtin.oldfiles, {})
        vim.keymap.set('n', '<leader>cs', builtin.colorscheme, {})
        vim.keymap.set('n', '<leader>vf', builtin.treesitter, {})
        vim.keymap.set('n', '<leader>cc', builtin.commands, {})

        --- LSP
        vim.keymap.set('n', 'gi', builtin.lsp_implementations, {})

        --- GIT
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
        vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
        vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
        vim.keymap.set(
            'n',
            '<leader>ps',
            function() builtin.grep_string({ search = vim.fn.input('Grep > ') }) end
        )

        require('telescope').load_extension('projects')
        require('telescope').load_extension('telescopeplugins')
    end,
}
