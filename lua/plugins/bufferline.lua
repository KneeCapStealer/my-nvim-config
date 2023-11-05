return {
    'akinsho/bufferline.nvim',
    name = 'bufferline',
    version = '*',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
        options = {
            offsets = {
                filetype = 'NvimTree',
                text = 'File Explorer',
                highlight = 'Directory',
                text_align = 'left',
            },
            diagnostics = 'nvim_lsp',
            diagnostics_indicator = function(count, level)
                local icon = level:match('error') and ' ' or ' '
                return ' ' .. icon .. count
            end,
        },
    },
    init = function()
        vim.opt.termguicolors = true

        vim.keymap.set('n', 'æ', '<cmd> BufferLineCyclePrev <CR>')
        vim.keymap.set('n', 'ø', '<cmd> BufferLineCycleNext <CR>')
        vim.keymap.set('n', '<leader>æ', '<cmd> BufferLineGoToBuffer 1 <CR>')
        vim.keymap.set('n', '<leader>ø', '<cmd> BufferLineGoToBuffer -1 <CR>')
        vim.keymap.set('n', '<leader>bd', '<cmd> bdelete!<CR>')
    end,
}
