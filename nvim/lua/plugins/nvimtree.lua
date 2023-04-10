vim.g.nvim_tree_lint_lsp = 1

vim.cmd[[highlight NvimTreeSymlink guifg=blue gui=bold,underline]]

require("nvim-tree").setup {
  open_on_setup = false,
  filters = {
    dotfiles = false,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    debounce_delay = 50,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  renderer = {
    icons = {
      glyphs = {
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
      }
    },
    highlight_git = true
  },
  view = {
    width = 35,
  }
}
