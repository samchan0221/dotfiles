local nvim_lsp = require('lspconfig')
local null_ls = require("null-ls")
local typescript_nvim = require('typescript')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local rust_tools = require('rust-tools')
local utils = require('utils')

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

local has_eslint_config = true
null_ls.setup {
  sources = {
    -- typescript
    null_ls.builtins.formatting.prettierd,
    has_eslint_config and null_ls.builtins.diagnostics.eslint_d,
    has_eslint_config and null_ls.builtins.code_actions.eslint_d,
    --- clang
    null_ls.builtins.formatting.clang_format,
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

rust_tools.setup({
  server = {
    on_attach = function(_, bufnr)
      on_attach_default(_, bufnr)
      vim.keymap.set("n", "K", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set("n", "<space>ca", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

nvim_lsp.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

nvim_lsp.rnix.setup {
  capabilities = default_capabilities,
  on_attach = on_attach_default,
}

nvim_lsp.pyright.setup {
  capabilities = default_capabilities,
  on_attach = on_attach_default,
}

nvim_lsp.cssls.setup {
  capabilities = default_capabilities,
  on_attach = on_attach_default,
}

nvim_lsp.hls.setup {
  capabilities = default_capabilities,
  on_attach = on_attach_default,
}

nvim_lsp.docker_compose_language_service.setup {
  capabilities = default_capabilities,
  on_attach = on_attach_default,
}

nvim_lsp.denols.setup {
  capabilities = default_capabilities,
  on_attach = on_attach_default,
}

nvim_lsp.terraformls.setup {
  capabilities = default_capabilities,
  on_attach = on_attach_default,
}

nvim_lsp.clangd.setup {
  capabilities = default_capabilities,
  on_attach = function(client, bufnr)
    on_attach_default(client, bufnr)
  end,
}

-- format on save
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.ts,*.tsx,*.lua,*.rs,*.json,*.yaml,*.yml,*.cs,*.nix,*.js,*.cpp,*.h lua vim.lsp.buf.format({}, 5000)
augroup END
]], true)
