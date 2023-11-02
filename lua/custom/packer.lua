return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')

    --- Treesitter
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    --- Telescope
    use({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        requires = { { 'nvim-lua/plenary.nvim' } },
    })

    --- Color Scheme
    use('navarasu/onedark.nvim')

    --- LSP
    use({
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
            -- LuaSnip
            { 'L3MON4D3/cmp_luasnip' },
        },
    })

    use('mbbill/undotree')

    use('simrat39/rust-tools.nvim')

    use({ 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } })
    use('theHamsta/nvim-dap-virtual-text')
    use('leoluz/nvim-dap-go')

    use('folke/neodev.nvim')

    -- lualine
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    })

    use({ 'j-hui/fidget.nvim', tag = 'legacy' })

    use('RRethy/vim-illuminate')

    use({
        'goolord/alpha-nvim',
        event = 'VimEnter',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local opts = require('chris.beautifier9001').DashboardConfig()
            require('alpha').setup(opts)
        end,
    })

    use('nvim-tree/nvim-web-devicons')

    use('andweeb/presence.nvim')

    use({
        'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
    })

    use('Shatur/neovim-session-manager')

    use('ahmedkhalf/project.nvim')

    use('KneeCapStealer/telescope-plugins')

    use('stevearc/dressing.nvim')

    use('stevearc/conform.nvim')

    use('mfussenegger/nvim-lint')

    use({
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup({}) end,
    })

    use({
        'akinsho/bufferline.nvim',
        tag = '*',
        requires = 'nvim-tree/nvim-web-devicons',
    })

    use({
        'SmiteshP/nvim-navic',
        requires = 'neovim/nvim-lspconfig',
        config = function()
            local opts = require('custom.configs.winbar').navic
            require('nvim-navic').setup(opts)
        end,
    })

    use({
        'SmiteshP/nvim-navbuddy',
        requires = {
            'neovim/nvim-lspconfig',
            'SmiteshP/nvim-navic',
            'MunifTanjim/nui.nvim',
            'numToStr/Comment.nvim', -- Optional
            'nvim-telescope/telescope.nvim', -- Optional
        },
    })

    use({
        'utilyre/barbecue.nvim',
        tag = '*',
        requires = {
            'SmiteshP/nvim-navic',
            'nvim-tree/nvim-web-devicons', -- optional dependency
        },
        after = 'nvim-web-devicons', -- keep this if you're using NvChad
        config = function()
            local opts = require('custom.configs.winbar').barbecue
            require('barbecue').setup(opts)
        end,
    })
end)
