local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

local mason = require('mason')
local mason_config = require('mason-lspconfig')

mason.setup({})

mason_config.setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  -- ensure_installed = { 'lua_ls', 'pylsp', 'bashls' },
  handlers = {
    lsp_zero.default_setup,
  },
})

-- setup various language servers
local lsp_config = require('lspconfig')
lsp_config.lua_ls.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = 'Replace',
      },
      diagnostics = { disable = { 'missing-fields' } },
    }
  }
})
lsp_config.bashls.setup({})
lsp_config.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { 'W391', 'W503' },
          maxLineLength = 100
        }
      }
    }
  }
}
-- lsp_config.clangd.setup({
--   single_file_support = false
-- })
-- lsp_config.ccls.setup ({
--   init_options = {
--     index = {
--       threads = 1;
--     };
--     clang = {
--       excludeArgs = { '-frounding-math' };
--       extraArgs = {
--         '--gcc-toolchain=/spare/local/condacem/.micromamba/northmoore_common/python_bf587cbc599faf86305ead85e40cc5e8/',
--         '-I/spare/local/condacem/.micromamba/northmoore_common/python_bf587cbc599faf86305ead85e40cc5e8/include/c++/v1/'
--       };
--     };
--   }
-- })

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({ select = false }),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  })
})
