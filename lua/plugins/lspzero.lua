return {
    'VonHeikemen/lsp-zero.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    branch = 'v3.x',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',

        'simrat39/rust-tools.nvim',
        -- LSP Support
        'neovim/nvim-lspconfig',
        -- neodev
        'folke/neodev.nvim',
    },
    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(_, bufnr)
            local opts = { buffer = bufnr, remap = false }

            vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
            vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
            vim.keymap.set('n', '<S-d>', vim.diagnostic.goto_next, opts)
            vim.keymap.set('n', '<A-d>', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, opts)
            vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
        end)

        lsp_zero.set_preferences({
            sign_icons = {},
        })

        require('neodev').setup({
            library = { plugins = { 'nvim-dap-ui' }, types = true },
        })

        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }

        require('mason').setup({
            ensure_installed = { 'clang-format' },
        })

        require('mason-lspconfig').setup({
            ensure_installed = {
                'clangd',
                'rust_analyzer',
                'lua_ls',
                'neocmake',
            },
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    lua_opts.capabilities = capabilities
                    lspconfig.lua_ls.setup(lua_opts)
                end,
                rust_analyzer = function()
                    local rust_tools = require('rust-tools')

                    rust_tools.setup({
                        server = {
                            on_attach = function(client, bufnr)
                                require('navic').attach(client, bufnr)
                                vim.keymap.set(
                                    'n',
                                    '<C-space>',
                                    rust_tools.hover_actions.hover_actions,
                                    { buffer = bufnr }
                                )
                                -- Code action groups
                                vim.keymap.set(
                                    'n',
                                    '<Leader>a',
                                    rust_tools.code_action_group.code_action_group,
                                    { buffer = bufnr }
                                )
                            end,
                        },
                        dap = require('dap').adapters.codelldb,
                    })
                end,
                clangd = function()
                    lspconfig.clangd.setup({
                        cmd = {
                            'clangd',
                            '--background-index',
                            '-j=12',
                            '--clang-tidy',
                            '--all-scopes-completion',
                            '--cross-file-rename',
                            '--completion-style=detailed',
                            '--header-insertion-decorators',
                            '--header-insertion=iwyu',
                            '--pch-storage=memory',
                        },
                        on_attach = function(client, bufnr)
                            client.server_capabilities.signatureHelpProvoder = false
                            require('navic').attach(client, bufnr)
                            require('nvim-navbuddy').attach(client, bufnr)
                        end,
                        capabilities = capabilities,
                        on_new_config = function(new_config, _)
                            local status, cmake = pcall(require, 'cmake-tools')
                            if status then cmake.clangd_on_new_config(new_config) end
                        end,
                    })
                end,
                neocmake = function()
                    lspconfig.neocmake.setup({
                        default_config = {
                            cmd = { 'neocmakelsp', '--stdio' },
                            filetypes = { 'cmake' },
                            root_dir = function(fname)
                                return lspconfig.util.find_git_ancestor(fname)
                            end,
                            single_file_support = true, -- suggested
                            on_attach = lsp_zero.on_attach, -- on_attach is the on_attach function you defined
                            init_options = {
                                format = {
                                    enable = true,
                                },
                            },
                        },
                    })
                end,
            },
        })
    end,
}
