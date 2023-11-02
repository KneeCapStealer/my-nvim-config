local M = {}

M.navic = {
    icons = {
        File = ' ',
        Module = ' ',
        Namespace = ' ',
        Package = ' ',
        Class = ' ',
        Method = ' ',
        Property = ' ',
        Field = ' ',
        Constructor = ' ',
        Enum = ' ',
        Interface = ' ',
        Function = ' ',
        Variable = ' ',
        Constant = ' ',
        String = ' ',
        Number = ' ',
        Boolean = ' ',
        Array = ' ',
        Object = ' ',
        Key = ' ',
        Null = ' ',
        EnumMember = ' ',
        Struct = ' ',
        Event = ' ',
        Operator = ' ',
        TypeParameter = ' ',
    },
}

M.barbecue = function()
    vim.api.nvim_create_autocmd({
        'WinResized',
        'BufWinEnter',
        'CursorHold',
        'InsertLeave',
    }, {
        group = vim.api.nvim_create_augroup('barbecue.updater', {}),
        callback = function() require('barbecue.ui').update() end,
    })
    return {
        create_autocmd = false,
    }
end

return M
