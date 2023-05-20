local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = true,
})

lsp.ensure_installed({
  'tsserver',
  'lua_ls',
  'rust_analyzer',
})

lsp.skip_server_setup({ 'jdtls' })

lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
      format = {
        enable = true,
        defaultConfig = {
          indent_style = "space",
          indent_size = "1",
          max_line_length = "80"
        }
      },
    }
  }
})


-- lsp.configure('html', {
--   settings = {
--     html = {
--       format = {
--         templating = true,
--         wrapLineLength = 80,
--         wrapAttributes = 'auto',
--       },
--       hover = {
--         documentation = true,
--         references = true,
--       },
--     },
--   },
-- })

local cmp = require('cmp')

lsp.setup_nvim_cmp({
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp', },
    { name = 'buffer',   keyword_length = 3 },
    { name = 'luasnip' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-s>'] = cmp.mapping.scroll_docs( -4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),

  }),
  formatting = {
    -- changing the order of fields so the icon is the first
    fields = { 'menu', 'abbr', 'kind' },

    -- here is where the change happens
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
        nvim_lua = 'Π',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
})

lsp.on_attach(function(client, bufnr)
  require('user.lsp_keymaps').do_map_keys(bufnr);
end)

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = "",
    warning = "",
    hint = "",
    information = "",
    other = "﫠"
  }
})

lsp.setup()

vim.diagnostic.config({
})
