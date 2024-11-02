

-- keymaps/editing.lua

vim.keymap.set('', ';', ':')
vim.keymap.set({ '!', 's' }, 'jj', '<esc>')

vim.keymap.set('n', '<leader>o', 'o<esc>')
vim.keymap.set('n', '<leader>O', 'O<esc>')

vim.keymap.set('n', 'g;', 'g;zz', { silent = true })
vim.keymap.set('n', 'g', 'g,zz', { silent = true })

vim.keymap.set('n', '<leader>/', '<cmd>noh<cr>', { silent = true })
vim.keymap.set('n', '<leader><tab>', 'za', { silent = true })

vim.keymap.set('n', '<leader>x',
  '<cmd>%s/\\s\\+$//<cr>let @/=""<cr>',
    { silent = true })
vim.keymap.set('n', '<leader>@',
  '<cmd>set fileformat=unix<cr><cmd>retab<cr><cmd>%s/    /  /g<cr>',
    { silent = true })

vim.keymap.set('n', '<leader>]',
  '<cmd>e ' .. vim.g.configpath .. '/init.lua<cr>',
    { silent = true })
vim.keymap.set('n', '<leader>[',
  '<cmd>e ' .. vim.g.configpath .. '/lua/plugins.lua<cr>',
    { silent = true })
vim.keymap.set('n', '<leader>^',
    '<cmd>w<cr><cmd>so ' .. vim.g.configpath .. '/init.lua<cr>',
    { silent = true })
