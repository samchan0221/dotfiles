local nvim_lsp = require('lspconfig')
local null_ls = require("null-ls")
local typescript_nvim = require('typescript')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

local default_capabilities = cmp_nvim_lsp.default_capabilities()

local function diagnostic_open_float()
  vim.diagnostic.open_float(0, { scope = "line", border = "single" })
end

local on_attach_default = function(_, bufnr)
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>e', diagnostic_open_float, bufopts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
end

null_ls.setup {
  sources = {
    -- typescript
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d
  }
}

typescript_nvim.setup {
  disable_commands = false,
  debug = false,
  go_to_source_definition = {
    fallback = true,
  },
  server = {
    on_attach = function(client, bufnr)
      -- disable tsserver formatting if you plan on formatting via null-ls
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false

      vim.lsp.handlers["textDocument/publishDiagnostics"] =
      vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        -- delay update diagnostics
        update_in_insert = false
      })

      on_attach_default()

      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set('n', '<space>lo', typescript_nvim.actions.organizeImports, bufopts)
      vim.keymap.set('n', '<space>ia', typescript_nvim.actions.addMissingImports, bufopts)
    end,
  },
}

nvim_lsp.sumneko_lua.setup {
  capabilities = default_capabilities,
  on_attach = on_attach_default,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}

nvim_lsp.rnix.setup {
  capabilities = default_capabilities,
  on_attach = on_attach_default,
}

-- format on save
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.ts,*.tsx,*.lua,*.rs,*.json,*.yaml,*.yml,*.cs,*.nix lua vim.lsp.buf.format({}, 5000)
augroup END
]], true)
