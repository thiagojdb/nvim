vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- greatest remap ever
vim.keymap.set("x", "<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")


vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { silent = true})

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  { silent = true, noremap = true }
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  { silent = true, noremap = true }
)


-- require("trouble").setup {
--   height = 10, -- height of the trouble list when position is top or bottom
--   width = 50, -- width of the list when position is left or right
--   icons = true, -- use devicons for filenames
--   mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
--   fold_open = "", -- icon used for open folds
--   fold_closed = "", -- icon used for closed folds
--   group = true, -- group results by file
--   padding = true, -- add an extra new line on top of the list
--   action_keys = { -- key mappings for actions in the trouble list
--     -- map to {} to remove a mapping, for example:
--     -- close = {},
--     close = "q", -- close the list
--     cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
--     refresh = "r", -- manually refresh
--     jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
--     open_split = { "<c-x>" }, -- open buffer in new split
--     open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
--     open_tab = { "<c-t>" }, -- open buffer in new tab
--     jump_close = { "o" }, -- jump to the diagnostic and close the list
--     toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
--     toggle_preview = "P", -- toggle auto_preview
--     hover = "K", -- opens a small popup with the full multiline message
--     preview = "p", -- preview the diagnostic location
--     close_folds = { "zM", "zm" }, -- close all folds
--     open_folds = { "zR", "zr" }, -- open all folds
--     toggle_fold = { "zA", "za" }, -- toggle fold of current file
--     previous = "k", -- previous item
--     next = "j" -- next item
--   },
--   indent_lines = true, -- add an indent guide below the fold icons
--   auto_open = false, -- automatically open the list when you have diagnostics
--   auto_close = false, -- automatically close the list when you have no diagnostics
--   auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
--   auto_fold = false, -- automatically fold a file trouble list at creation
--   auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
--   signs = {
--     -- icons / text used for a diagnostic
--     error = "",
--     warning = "",
--     hint = "",
--     information = "",
--     other = "﫠"
--   },
--   use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
-- }
