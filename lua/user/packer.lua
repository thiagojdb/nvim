return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use("nvim-telescope/telescope.nvim")

  use("mbbill/undotree")
  use("dstein64/vim-startuptime")

  use("mfussenegger/nvim-jdtls")
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        ---Add a space b/w comment and the line
        padding = true,
        ---Whether the cursor should stay at its position
        sticky = true,
        ---Lines to be ignored while (un)comment
        ignore = nil,
        ---LHS of toggle mappings in NORMAL mode
        toggler = {
          ---Line-comment toggle keymap
          line = 'gcc',
          ---Block-comment toggle keymap
          block = 'gbc',
        },
        ---LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
          ---Line-comment keymap
          line = 'gc',
          ---Block-comment keymap
          block = 'gb',
        },
        ---LHS of extra mappings
        extra = {
          ---Add comment on the line above
          above = 'gcO',
          ---Add comment on the line below
          below = 'gco',
          ---Add comment at the end of line
          eol = 'gcA',
        },
        ---Enable keybindings
        ---NOTE: If given `false` then the plugin won't create any mappings
        mappings = {
          ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
          basic = true,
          ---Extra mapping; `gco`, `gcO`, `gcA`
          extra = true,
        },
        ---Function to call before (un)comment
        pre_hook = nil,
        ---Function to call after (un)comment
        post_hook = nil,
      })
    end
  }

  use('f-person/git-blame.nvim')
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use({
    'rose-pine/neovim',
    as = 'rose-pine'
  }) -- Lua
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
    end
  }

  use 'simrat39/rust-tools.nvim'

  use "lukas-reineke/indent-blankline.nvim"
  use('ThePrimeagen/vim-be-good')
  use("nvim-treesitter/nvim-treesitter", {
    run = ":TSUpdate"
  })

  use("ThePrimeagen/harpoon")

  use { 'nvim-telescope/telescope-ui-select.nvim' }
  use("nvim-treesitter/playground")
  use("romgrk/nvim-treesitter-context")
  use 'akinsho/flutter-tools.nvim'
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
  use 'folke/tokyonight.nvim'
end)
