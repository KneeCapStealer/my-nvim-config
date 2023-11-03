return {
    'windwp/nvim-autopairs',
    dependencies = {
        'hrsh7th/nvim-cmp',
    },
    event = 'InsertEnter',
    opts = {
        map_c_h = true,
        map_cr = true,
    }, -- this is equalent to setup({}) function
}
