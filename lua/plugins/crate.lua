return {
    'saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        src = {
            cmp = {
                enabled = true,
                name = 'Crates',
            },
        },
    },
}
