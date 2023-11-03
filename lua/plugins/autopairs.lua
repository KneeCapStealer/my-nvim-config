return {
    'windwp/nvim-autopairs',
    dependencies = {
        'hrsh7th/nvim-cmp',
    },
    event = 'InsertEnter',
    opts = {
        map_c_h = true,
    }, -- this is equalent to setup({}) function
    init = function()
        -- If you want insert `(` after select function or method item
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

        local handlers = require('nvim-autopairs.completion.handlers')

        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done({
                filetypes = {
                    -- "*" is a alias to all filetypes
                    ['*'] = {
                        ['('] = {
                            kind = {
                                cmp.lsp.CompletionItemKind.Function,
                                cmp.lsp.CompletionItemKind.Method,
                            },
                            handler = handlers['*'],
                        },
                    },
                },
            })
        )
    end,
}
