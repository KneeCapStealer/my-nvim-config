return {
    'catppuccin/nvim',
    name = 'catppuccin',
    main = 'catppuccin',
    priority = 1000,
    config = function()
        require('catppuccin').setup({
            flavour = 'frappe',
            styles = {
                keywords = { 'italic' },
            },
        })
    end,
}
