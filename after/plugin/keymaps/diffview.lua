vim.keymap.set("n","<leader>gdo", function()
  require'diffview'.open() end)

vim.keymap.set("n","<leader>gdc", function()
  require'diffview'.close() end)
