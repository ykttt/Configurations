-- keymaps/luasnip.lua
--
local ls, k = require("luasnip"), vim.keymap
k.set({ "i" }, "mm", function()
  ls.expand_or_jump()
end, { silent = true })
k.set({ "i", "s" }, "nn", function()
  ls.jump(-1)
end, { silent = true })
