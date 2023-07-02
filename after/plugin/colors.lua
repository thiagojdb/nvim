require("catppuccin").setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})
-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
--
-- local namespace = vim.api.nvim_create_namespace("dap-hlng")
-- vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 1, fg = '#993939', bg = '#31353f' })
-- vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 1, fg = '#61afef', bg = '#31353f' })
-- vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })
-- vim.fn.sign_define('DapBreakpoint', {
--   text = '',
--   texthl = 'DapBreakpoint',
--   linehl = 'DapBreakpoint',
--   numhl = 'DapBreakpoint'
-- })
-- vim.fn.sign_define('DapBreakpointCondition',
--   { text = 'ﳁ', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
-- vim.fn.sign_define('DapBreakpointRejected',
--   { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
-- vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' })
-- vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })
