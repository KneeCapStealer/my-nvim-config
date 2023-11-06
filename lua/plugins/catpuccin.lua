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
                dap = {
                    enabled = true,
                    enable_ui = true,
                },
            },
        })
    end,
}
