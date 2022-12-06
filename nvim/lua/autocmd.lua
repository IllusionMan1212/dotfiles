-- vim.cmd[[autocmd BufWritePre *js,*ts,*jsx,*tsx,*.graphql,*.json,*.md,*.mdx,*.svelte,*.yml,*yaml :Prettier]]
vim.cmd[[au TextYankPost * silent! lua vim.highlight.on_yank()]]

-- golang lsp stuff
local cfg = {
  goimport='gopls',
  gofmt='gopls',
  max_line_len = 120, -- max line length in goline format
  tag_transform = false, -- tag_transfer  check gomodifytags for details
  test_template = '', -- default to testify if not set; g:go_nvim_tests_template  check gotests for details
  test_template_dir = '', -- default to nil if not set; g:go_nvim_tests_template_dir  check gotests for details
  comment_placeholder = '' ,  -- comment_placeholder your cool placeholder e.g. ﳑ       
  verbose = false,  -- output loginf in messages
  lsp_cfg = false, -- true: apply go.nvim non-default gopls setup
  lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = false, -- if a on_attach function provided:  attach on_attach function to gopls
                       -- true: will use go.nvim on_attach if true
                       -- nil/false do nothing
  gopls_cmd = '$HOME/go/bin/gopls', -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile",
  lsp_diag_hdlr = true, -- hook lsp diag handler
  dap_debug = false, -- set to true to enable dap
  dap_debug_keymap = true, -- set keymaps for debugger
  dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
  dap_debug_vt = true, -- set to true to enable dap virtual text
}
require('go').setup(cfg)
require("go.format").goimport()

vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

-- set the filetype for prisma files
vim.api.nvim_exec([[ autocmd BufRead,BufNewFile *.prisma set filetype=prisma]], false)

