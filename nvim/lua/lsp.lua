local function setup_diagnostics()
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = false,
      virtual_text = true,
      signs = true,
      update_in_insert = false,
    }
  )
end

local lspconfig = require'lspconfig'
local function custom_on_attach(client)
  print('Attaching to ' .. client.name)
  setup_diagnostics()
end

local default_config = {
  on_attach = custom_on_attach,
}

require'diagnosticls-configs'.init(default_config)

local eslint = require 'diagnosticls-configs.linters.eslint'

local prettier = require 'diagnosticls-configs.formatters.prettier'

require 'diagnosticls-configs'.setup {
  ['javascript'] = {
    linter = eslint,
    formatter = prettier
  },
  ['javascriptreact'] = {
    linter = eslint,
    formatter = prettier
  },
  ['typescript'] = {
    linter = eslint,
    formatter = prettier
  },
  ['typescriptreact'] = {
    linter = eslint,
    formatter = prettier
  }
}

lspconfig.tsserver.setup(default_config)
lspconfig.gopls.setup(default_config)
lspconfig.clangd.setup(default_config)
lspconfig.cmake.setup(default_config)
lspconfig.dartls.setup(default_config)
lspconfig.csharp_ls.setup(default_config)
-- lspconfig.denols.setup(default_config)
lspconfig.kotlin_language_server.setup(default_config)
lspconfig.pyright.setup(default_config)
-- lspconfig.phpactor.setup(default_config)
-- lspconfig.psalm.setup(default_config)
lspconfig.intelephense.setup(default_config)
lspconfig.rust_analyzer.setup(default_config)
lspconfig.prismals.setup(default_config)
-- lspconfig.tailwindcss.setup(default_config)
lspconfig.lua_ls.setup(default_config)

vim.g.completion_matching_strategy_list = {'substring', 'exact', 'fuzzy', 'all'}
vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_insert_delay = 1
vim.g.completion_chain_complete_list = {
  {complete_items = {'lsp', 'snippet'}},
  {mode = '<c-p>'},
  {mode = '<c-n>'},
}
