return {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local lint = require('lint')

        lint.linters_by_ft = {
            -- cpp = { 'clangtidy' }, -- clangtidy can be used via clangd
            -- c = { 'clangtidy' },
        }

        lint.linters.clangtidy = {
            -- cmd = 'clang-tidy',
        }

        local lint_augroup =
            vim.api.nvim_create_augroup('lint', { clear = true })

        vim.api.nvim_create_autocmd({ 'BufWritePost', 'InsertLeave' }, {
            group = lint_augroup,
            callback = function() lint.try_lint() end,
        })

        vim.keymap.set(
            'n',
            '<leader>l',
            function() lint.try_lint() end,
            { desc = 'Trigger linting in current file' }
        )
    end,
}
