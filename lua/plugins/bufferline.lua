return {
    'akinsho/bufferline.nvim',
    name = 'bufferline',
    version = '*',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
        options = {
            mode = 'tabs',
            themable = false,
            numbers = 'ordinal',
            hover = {
                enables = true,
                delay = 100,
                reveal = { 'close' },
            },
            offsets = {
                {
                    filetype = 'NvimTree',
                    text = 'File Explorer',
                    text_align = 'left',
                    separator = true,
                },
            },
            diagnostics = 'nvim_lsp',
            diagnostics_indicator = function(count, level)
                local icon = level:match('error') and ' ' or ' '
                return ' ' .. icon .. count
            end,
        },
    },
    init = function()
        local bufferline = require('bufferline')
        local telescope_theme = require('telescope.themes').get_cursor()

        vim.opt.termguicolors = true

        -- Cycle buffers
        vim.keymap.set('n', 'æ', function() bufferline.cycle(-1) end)
        vim.keymap.set('n', 'ø', function() bufferline.cycle(1) end)
        vim.keymap.set(
            'n',
            '<leader>æ',
            function() bufferline.go_to(1, true) end
        )
        vim.keymap.set(
            'n',
            '<leader>ø',
            function() bufferline.go_to(-1, true) end
        )
        vim.keymap.set('n', '<leader>n', function()
            local buffers = bufferline.get_elements().elements
            local buf_num = 0

            vim.ui.select(buffers, {
                format_item = function(item)
                    buf_num = buf_num + 1
                    return string.format('%d. %s', buf_num, item.name)
                end,
                prompt = 'Buffers',
                telescope = telescope_theme,
            }, function(_, idx) bufferline.go_to(idx, true) end)
        end)

        -- Change buffer order
        vim.keymap.set('n', '<A-æ>', function() bufferline.move(-1) end)

        vim.keymap.set('n', '<A-ø>', function() bufferline.move(1) end)
    end,
}
