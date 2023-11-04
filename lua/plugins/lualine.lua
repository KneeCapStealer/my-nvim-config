return {
    'nvim-lualine/lualine.nvim',
    event = { 'VeryLazy' },
    dependencies = {
        'kyazdani42/nvim-web-devicons',
    },
    opts = {
        options = {
            theme = 'auto',
            icons_enabled = true,
            section_separators = { left = '', right = '' },
            component_separators = { left = '', right = '' },
            disabled_filetypes = {},
        },
        sections = {
            lualine_a = { 'mode', 'selectioncount' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = { 'filename' },
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {},
        },
    },
}