return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'nvim-tree/nvim-web-devicons'
    -- File search
    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")
    use("ThePrimeagen/git-worktree.nvim")
    use("nvim-lua/popup.nvim")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("onsails/lspkind-nvim")
    use("nvim-lua/lsp_extensions.nvim")
    use("glepnir/lspsaga.nvim")
    use("simrat39/symbols-outline.nvim")
    use("mbbill/undotree")
    use("mfussenegger/nvim-jdtls")
    use('f-person/git-blame.nvim')
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use({
        'rose-pine/neovim',
        as = 'rose-pine'
    })

    use 'simrat39/rust-tools.nvim'

    use('ThePrimeagen/vim-be-good')
    use('folke/tokyonight.nvim')
    -- I don't even know, but code looks pretter
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })

    use("ThePrimeagen/harpoon")
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

    -- Colorscheme
    use("gruvbox-community/gruvbox")
    use({ "catppuccin/nvim", as = "catppuccin" })
    use('tanvirtin/monokai.nvim')
    use { 'nvim-telescope/telescope-ui-select.nvim' }
    --Set this up later
    use("nvim-treesitter/playground")
    use("romgrk/nvim-treesitter-context")
    --
    --
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")
    use('RRethy/vim-illuminate')

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use {
        'nvim-lualine/lualine.nvim',
    }
end)
