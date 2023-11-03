return {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        formatters_by_ft = {
            cpp = { 'clang_format' },
            lua = { 'stylua' },
        },
        format_on_save = {
            lsp_fallback = true,
            async = false,
            timeout_ms = 500,
        },
    },
    init = function()
        vim.keymap.set(
            { 'n', 'v' },
            '<leader>f',
            function()
                require('conform').format({
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 500,
                })
            end,
            { desc = 'Format file or range (in visual mode)' }
        )
    end,
}
