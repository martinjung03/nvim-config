local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })

  -- custom key binding example
  local opts = { buffer = true }

  -- lsp
  vim.keymap.set('n', '<leader>lI', vim.cmd.LspInfo, opts)                                            -- hover
  vim.keymap.set('n', '<leader>li', '<cmd>Telescope lsp_incoming_calls<cr>', opts)                    -- incoming calls
  vim.keymap.set('n', '<leader>lo', '<cmd>Telescope lsp_outgoing_calls<cr>', opts)                    -- outgoing calls
  vim.keymap.set('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)                         -- hover
  vim.keymap.set('n', '<leader>lj', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)                    -- jump
  vim.keymap.set('n', '<leader>lr', '<cmd>Telescope lsp_references<cr>', opts)                        -- reference
  vim.keymap.set('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)                        -- Rename
  vim.keymap.set({ 'n', 'x' }, '<leader>lf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts) -- format
  vim.keymap.set('n', '<leader>lc', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)                   -- code action
  vim.keymap.set('n', '<leader>ls', '<cmd>Telescope lsp_document_symbols<cr>', opts)                  -- symbol

  -- diagnostic
  vim.keymap.set('n', '<leader>dl', '<cmd>Telescope diagnostics<cr>', opts)
  vim.keymap.set('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
  vim.keymap.set('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)

  -- not sure if I need these
  -- vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  -- vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  -- vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  -- vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  -- vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)

  -- format on save
  lsp.buffer_autoformat()
end)

lsp.ensure_installed({
  'gopls',
  'eslint',
  'tsserver',
  'tailwindcss',
  'lua_ls',
  'rust_analyzer',
  'pylsp',
  'emmet_ls',
  'cssls',
  'jsonls',
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- icons
lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

-- format mapping
lsp.format_on_save({
  format_opts = {
    timeout_ms = 10000,
  },
  servers = {
    ['null-ls'] = { 'javascript', 'typescript' },
  }
})

lsp.setup()

-- null ls
local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    --- Replace these with the tools you have installed
    null_ls.builtins.formatting.prettier,
  }
})

-- Make sure you setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'buffer',  keyword_length = 3 },
    { name = 'luasnip', keyword_length = 2 },
  },
  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select_opts),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select_opts),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }
})
