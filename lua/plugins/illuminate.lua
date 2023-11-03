return {
    'RRethy/vim-illuminate',
    event = { 'BufRead' },
    config = function() require('illuminate').configure() end,
}
