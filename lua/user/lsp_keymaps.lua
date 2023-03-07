local M = {};

M.do_map_keys = function(bufnr)
  local ts = require('telescope.builtin');
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
  vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>rr", function() ts.lsp_references() end, opts)
  vim.keymap.set('n', 'gtd', function() ts.lsp_type_definitions() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set('x', '<F4>', function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<F4>", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("i", "<F4>", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, opts)
  vim.keymap.set("x", "<leader>f", function() vim.lsp.buf.format() end, opts)
  -- Diagnostics
  --
  local errorDiagnostics = {
    bufnr = nil,
    severity = 2,
  }
  vim.keymap.set('n', '<leader>vd', function() ts.diagnostics({ errorDiagnostics }) end)
  vim.keymap.set('n', '<leader>vad', function() ts.diagnostics() end)
  vim.keymap.set("n", "<leader>ve", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
end

return M;
