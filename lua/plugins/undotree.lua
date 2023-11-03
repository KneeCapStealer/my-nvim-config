return {
    'mbbill/undotree',
    event = { 'BufEnterPost' },
    init = function() vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle) end,
}
