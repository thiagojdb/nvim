require'tokyonight'.setup {
    transparent = true,
    styles = {
       sidebars = "transparent",
       floats = "transparent",
    },
    on_highlights = function(hl, c)
    hl.DapBreakpoint = {
        ctermbg = 1, fg = '#61afef', bg = '#31353f' 
    }
    end
}

vim.cmd.colorscheme "tokyonight"
--
-- local namespace = vim.api.nvim_create_namespace("dap-hlng")
vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 1, fg = '#993939', bg = '#31353f' })
vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 1, fg = '#61afef', bg = '#31353f' })
vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })
vim.fn.sign_define('DapBreakpoint', {text = '⊚', texthl = 'DapBreakpoint',linehl = 'DapBreakpoint', numhl = 'DapBreakpoint'})
vim.fn.sign_define('DapBreakpointCondition', { text = 'ﳁ', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint', linehl = 'DapLogPoint', numhl = 'DapLogPoint' })
vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })
