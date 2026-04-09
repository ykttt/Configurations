-- keymaps/editing.lua
--
local k = vim.keymap
k.set("", ";", ":")

k.set("n", "<leader>o", "o<esc>")
k.set("n", "<leader>O", "O<esc>")

k.set("n", "g;", "g;zz", { silent = true })
k.set("n", "g", "g,zz", { silent = true })

k.set("n", "<leader>/", "<cmd>noh<cr>", { silent = true })
k.set("n", "<leader><tab>", "za", { silent = true })

k.set("n", "<leader>xe", '<cmd>%s/\\s\\+$//<cr>let @/=""<cr>', { silent = true })
k.set("n", "<leader>@", "<cmd>set fileformat=unix<cr><cmd>retab<cr><cmd>%s/    /  /g<cr>", { silent = true })

k.set("n", "<leader>]", "<cmd>e " .. vim.g.configpath .. "/init.lua<cr>", { silent = true })
k.set("n", "<leader>[", "<cmd>e " .. vim.g.configpath .. "/lua/plugins.lua<cr>", { silent = true })
k.set("n", "<leader>^", "<cmd>w<cr><cmd>so " .. vim.g.configpath .. "/init.lua<cr>", { silent = true })
