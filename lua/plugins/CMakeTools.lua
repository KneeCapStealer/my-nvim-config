return {
    'Civitasv/cmake-tools.nvim',
    ft = { 'c', 'cpp', 'cmake' },
    dependencies = {
        'nvim-lua/plenary.nvim',
        'rcarriga/nvim-dap-ui',
    },
    opts = {
        cmake_regenerate_on_save = true,
        cmake_generate_options = { '-G Ninja' },
        cmake_soft_link_compile_commands = true,
        cmake_build_directory = 'build/${variant:buildType}',

        cmake_dap_configuration = { -- debug settings for cmake
            name = 'cpp',
            type = 'codelldb',
            request = 'launch',
            stopOnEntry = false,
            runInTerminal = true,
            console = 'integratedTerminal',
        },
    },
    config = function(_, opts)
        require('cmake-tools').setup(opts)

        vim.keymap.set('n', '<F5>', '<cmd> CMakeDebug <CR>')
    end,
}
