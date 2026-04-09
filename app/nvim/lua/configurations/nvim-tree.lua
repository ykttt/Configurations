-- configurations/nvim-tree.lua
--
require("nvim-tree").setup({
  -- on_attach = on_attach(),
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
