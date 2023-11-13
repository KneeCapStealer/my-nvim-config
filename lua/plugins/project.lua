return {
    'ahmedkhalf/project.nvim',
    event = { 'VeryLazy' },
    opts = {
        detection_methods = { 'lsp', 'pattern' },
        patterns = { '.git', 'CMakeLists.txt', 'Cargo.toml', 'src' },
        silent_chdir = true,
        scope_chdir = 'global',
        datapath = vim.fn.stdpath('data'),
    },
}
