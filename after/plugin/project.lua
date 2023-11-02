require('project_nvim').setup({
    patterns = {
        '.git',
        'Makefile',
        'package.json',
        'cargo.toml',
        'CMakeLists.txt',
    },
    manual_mode = true,
    silent_chdir = false,
})
