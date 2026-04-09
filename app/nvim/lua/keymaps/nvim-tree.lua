-- keymaps/nvim-tree.lua
--
local k = vim.keymap

k.set("n", "<leader>;", "<cmd>NvimTreeToggle<cr>", { silent = true })

local function on_attach(bufnr)
  local api = require("nvim-tree.api")
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  k.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
  k.set("n", "<C-e>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
  k.set("n", "<C-k>", api.node.show_info_popup, opts("Info"))
  k.set("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
  k.set("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
  k.set("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
  k.set("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
  k.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
  k.set("n", "<CR>", api.node.open.edit, opts("Open"))
  k.set("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
  k.set("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
  k.set("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
  k.set("n", ".", api.node.run.cmd, opts("Run Command"))
  k.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
  k.set("n", "a", api.fs.create, opts("Create"))
  k.set("n", "bd", api.marks.bulk.delete, opts("Delete Bookmarked"))
  k.set("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
  k.set("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle Filter: No Buffer"))
  k.set("n", "c", api.fs.copy.node, opts("Copy"))
  k.set("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Filter: Git Clean"))
  k.set("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
  k.set("n", "]c", api.node.navigate.git.next, opts("Next Git"))
  k.set("n", "d", api.fs.remove, opts("Delete"))
  k.set("n", "D", api.fs.trash, opts("Trash"))
  k.set("n", "E", api.tree.expand_all, opts("Expand All"))
  k.set("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
  k.set("n", "]e", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
  k.set("n", "[e", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
  k.set("n", "F", api.live_filter.clear, opts("Clean Filter"))
  k.set("n", "f", api.live_filter.start, opts("Filter"))
  k.set("n", "g?", api.tree.toggle_help, opts("Help"))
  k.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
  k.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Filter: Dotfiles"))
  k.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Filter: Git Ignore"))
  k.set("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
  k.set("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
  k.set("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
  k.set("n", "o", api.node.open.edit, opts("Open"))
  k.set("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
  k.set("n", "p", api.fs.paste, opts("Paste"))
  k.set("n", "P", api.node.navigate.parent, opts("Parent Directory"))
  k.set("n", "q", api.tree.close, opts("Close"))
  k.set("n", "r", api.fs.rename, opts("Rename"))
  k.set("n", "R", api.tree.reload, opts("Refresh"))
  k.set("n", "s", api.node.run.system, opts("Run System"))
  k.set("n", "S", api.tree.search_node, opts("Search"))
  k.set("n", "U", api.tree.toggle_custom_filter, opts("Toggle Filter: Hidden"))
  k.set("n", "W", api.tree.collapse_all, opts("Collapse"))
  k.set("n", "x", api.fs.cut, opts("Cut"))
  k.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
  k.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
  k.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
  k.set("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))

  -- END_DEFAULT_ON_ATTACH
  -- Mappings migrated from view.mappings.list
  --
  -- You will need to insert "your code goes here" for any mappings with a custom action_cb

  k.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
end

require("nvim-tree").setup({ on_attach = on_attach })
