local lint = require('lint')

lint.linters_by_ft = {
    cpp = { 'clangtidy' },
    lua = { 'selene' },
}

lint.linters.selene = {
    cmd = 'selene.cmd',
}

lint.linters.clangtidy = {
    cmd = 'clang-tidy',
}

local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
    group = lint_augroup,
    callback = function() lint.try_lint() end,
})

vim.keymap.set(
    'n',
    '<leader>l',
    function() lint.try_lint() end,
    { desc = 'Trigger linting in current file' }
)
