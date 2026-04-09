-- keymaps/telescope.lua
--
local k = vim.keymap
k.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { silent = true })
k.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { silent = true })
k.set("n", "<leader>fh", "<cmd>Telescope oldfiles<cr>", { silent = true })
k.set("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { noremap = true, silent = true })
