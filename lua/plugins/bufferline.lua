return {
    'akinsho/bufferline.nvim',
    version = '*',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
        options = {
            diagnostics = 'nvim_lsp',
        },
    },
    init = function()
        vim.opt.termguicolors = true

        vim.keymap.set('n', '<A-k>', '<cmd> BufferLineCycleNext <CR>')
        vim.keymap.set('n', '<A-j>', '<cmd> BufferLineCyclePrev <CR>')
    end,
}
