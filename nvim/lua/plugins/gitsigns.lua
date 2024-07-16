vim.api.nvim_set_hl(0, 'GitSignsAdd',            { link = 'GitSignsAdd' })
vim.api.nvim_set_hl(0, 'GitSignsAddNr',          { link = 'GitSignsAddNr' })
vim.api.nvim_set_hl(0, 'GitSignsAddLn',          { link = 'GitSignsAddLn' })
vim.api.nvim_set_hl(0, 'GitSignsChange',         { link = 'GitSignsChange' })
vim.api.nvim_set_hl(0, 'GitSignsChangeNr',       { link = 'GitSignsChangeNr' })
vim.api.nvim_set_hl(0, 'GitSignsChangeLn',       { link = 'GitSignsChangeLn' })
vim.api.nvim_set_hl(0, 'GitSignsDelete',         { link = 'GitSignsDelete' })
vim.api.nvim_set_hl(0, 'GitSignsDeleteNr',       { link = 'GitSignsDeleteNr' })
vim.api.nvim_set_hl(0, 'GitSignsDeleteLn',       { link = 'GitSignsDeleteLn' })
vim.api.nvim_set_hl(0, 'GitSignsTopdelete',      { link = 'GitSignsDelete' })
vim.api.nvim_set_hl(0, 'GitSignsTopdeleteNr',    { link = 'GitSignsDeleteNr' })
vim.api.nvim_set_hl(0, 'GitSignsTopdeleteLn',    { link = 'GitSignsDeleteLn' })
vim.api.nvim_set_hl(0, 'GitSignsChangedelete',   { link = 'GitSignsChange' })
vim.api.nvim_set_hl(0, 'GitSignsChangedeleteNr', { link = 'GitSignsChangeNr' })
vim.api.nvim_set_hl(0, 'GitSignsChangedeleteLn', { link = 'GitSignsChangeLn' })

require('gitsigns').setup {
  numhl = false,
  linehl = false,
  watch_gitdir = {
    interval = 1000
  },
  diff_opts = {
    internal = true
  },
  current_line_blame = false,
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
}
