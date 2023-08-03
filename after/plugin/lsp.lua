vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
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
    vim.keymap.set("n", "<leader>dc", function() require'jdtls'.test_class() end, opts)
    vim.keymap.set("n", "<leader>dn", function() require'jdtls'.test_nearest_method() end, opts)

local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set("n", "<leader>l", "<cmd>w<CR><cmd>silent !prettier --write %<CR>",
  { buffer = bufnr, remap = true, silent = true, desc = "Format HTML file" })

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
  end,
})

require'lspconfig'.tsserver.setup{
single_file_support = false}
require'lspconfig'.tailwindcss.setup{}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}

require'lspconfig'.marksman.setup{}


require'lspconfig'.gopls.setup{}

require('sonarlint').setup({
   server = {
      cmd = { 
         'sonarlint-language-server',
         -- Ensure that sonarlint-language-server uses stdio channel
         '-stdio',
         '-analyzers',
         -- paths to the analyzers you need, using those for python and java in this example
         vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
         vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
         vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
      }
   },
   filetypes = {
      -- Tested and working
      'python',
      'cpp',
      -- Requires nvim-jdtls, otherwise an error message will be printed
      'java',
   }
})

