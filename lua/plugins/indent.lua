return {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = { 'BufRead', 'BufNewFile' },
    opts = {},
    init = function() vim.opt.listchars:append('eol:⤶') end,
}
