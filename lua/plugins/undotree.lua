return {
    'mbbill/undotree',
    event = { 'BufReadPre', 'BufNewFile' },
    init = function() vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle) end,
}
