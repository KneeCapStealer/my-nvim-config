return {
    'stevearc/conform.nvim',
    name = 'conform',
    keys = { '<leader>mp' },
    event = { 'BufWritePre' },
    opts = {
        formatters_by_ft = {
            cpp = { 'clang_format' },
            c = { 'clang_format' },
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
            '<leader>ff',
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
