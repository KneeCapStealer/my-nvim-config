return {
    'catppuccin/nvim',
    name = 'catppuccin',
    main = 'catppuccin',
    priority = 1000,
    config = function()
        require('catppuccin').setup({
            flavour = 'mocha',
            styles = {
                keywords = { 'italic' },
            },
            intergrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                alpha = true,
                harpoon = true,
                indent_blankline = {
                    enabled = true,
                    scope_color = 'lavender',
                    colored_indent_levels = false,
                },
                dap = {
                    enabled = true,
                    enable_ui = true,
                },
            },
            dim_inactive = {
                enabled = true,
                shade = 'dark',
                percentage = 0.45,
            },
        })
    end,
}
