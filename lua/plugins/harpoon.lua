return {
    'ThePrimeagen/harpoon',
    dependencies = {
        'nvim-telescope/telescope.nvim',
    },
    init = function()
        local h_ui = require('harpoon.ui')
        local h_mark = require('harpoon.mark')
        require('telescope').load_extension('harpoon')
        vim.keymap.set('n', 'æ', h_ui.nav_prev)
        vim.keymap.set('n', 'ø', h_ui.nav_next)
        vim.keymap.set('n', '<leader>m', h_mark.add_file)
        vim.keymap.set('n', '<leader>M', '<cmd> Telescope harpoon marks <CR>')
        vim.keymap.set('n', '<leader>n', function()
            vim.ui.input({
                prompt = 'Buffer number:',
            }, function(input)
                if not tonumber(input) then
                    print('Must be a number')
                    return
                end
                h_ui.nav_file(input)
            end)
        end)
    end,
    opts = {
        global_settings = {
            -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
            save_on_toggle = false,

            -- saves the harpoon file upon every change. disabling is unrecommended.
            save_on_change = true,

            -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
            enter_on_sendcmd = false,

            -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
            tmux_autoclose_windows = false,

            -- filetypes that you want to prevent from adding to the harpoon list menu.
            excluded_filetypes = {
                'harpoon',
                'NvimTree',
                'Alpha',
            },

            -- set marks specific to each git branch inside git repository
            mark_branch = false,

            -- enable tabline with harpoon marks
            tabline = false,
            tabline_prefix = '   ',
            tabline_suffix = '   ',
        },
    },
}
