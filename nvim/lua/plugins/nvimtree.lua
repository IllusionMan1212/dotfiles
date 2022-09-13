vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_lint_lsp = 1
-- vim.g.nvim_tree_lsp_diagnostics = 1

vim.g.nvim_tree_icons = {
  default= '',
  symlink= '',
  git= {
    unstaged= "✗",
    staged= "✓",
    unmerged= "",
    renamed= "➜",
    untracked= "★",
    deleted= "",
    ignored= "◌"
  },
  folder= {
    default= "",
    open= "",
    empty= "",
    empty_open= "",
    symlink= "",
    symlink_open= "",
  },
  lsp= {
    hint= "",
    info= "",
    warning= "",
    error= "",
  }
}

vim.cmd[[highlight NvimTreeSymlink guifg=blue gui=bold,underline]]

require("nvim-tree").setup {
  open_on_setup = false,
  auto_close = true,
  filters = {
    dotfiles = false,
  },
  view = {
    width = 35,
  }
}
