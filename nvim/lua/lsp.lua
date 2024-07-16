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
lspconfig.clangd.setup({
    on_attach = custom_on_attach,
    cmd = {
      "clangd",
      "--offset-encoding=utf-16"
    }
  })
lspconfig.cmake.setup(default_config)
lspconfig.dartls.setup(default_config)
lspconfig.csharp_ls.setup({
    on_attach = custom_on_attach,
    root_dir = function(startpath)
      return lspconfig.util.root_pattern("*.sln")(startpath)
      or lspconfig.util.root_pattern("*.csproj")(startpath)
      or lspconfig.util.root_pattern("*.fsproj")(startpath)
      or lspconfig.util.root_pattern(".git")(startpath)
    end,
  })
-- lspconfig.denols.setup(default_config)
lspconfig.kotlin_language_server.setup(default_config)
lspconfig.pyright.setup(default_config)
-- lspconfig.phpactor.setup(default_config)
-- lspconfig.psalm.setup(default_config)
lspconfig.intelephense.setup(default_config)
lspconfig.rust_analyzer.setup({
    on_attach = custom_on_attach,
    settings = {
      ["rust-analyzer"] = {
        assist = {
          importGranularity = "module",
          importPrefix = "by_self",
        },
        cargo = {
          loadOutDirsFromCheck = true
        },
        checkOnSave = {
          allFeatures = true,
          overrideCommand = {
            'cargo', 'clippy', '--workspace', '--message-format=json',
            '--all-targets', '--all-features'
          }
        },
        procMacro = {
          enable = true
        },
      }
    }
  })
lspconfig.prismals.setup(default_config)
-- lspconfig.tailwindcss.setup(default_config)
lspconfig.lua_ls.setup(default_config)
lspconfig.glsl_analyzer.setup(default_config)
lspconfig.ols.setup(default_config)

vim.g.completion_matching_strategy_list = {'substring', 'exact', 'fuzzy', 'all'}
vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_insert_delay = 1
vim.g.completion_chain_complete_list = {
  {complete_items = {'lsp', 'snippet'}},
  {mode = '<c-p>'},
  {mode = '<c-n>'},
}
