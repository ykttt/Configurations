

-- keymaps/luasnip.lua


local ls = require('luasnip')

vim.keymap.set({ 'i' }, 'mm', function() ls.expand_or_jump() end, { silent = true, })
vim.keymap.set({ 'i', 's' }, 'nn', function() ls.jump(-1) end, { silent = true, })
