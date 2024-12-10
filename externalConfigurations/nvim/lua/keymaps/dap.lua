-- keymaps/dap.lua
--
vim.keymap.set("n", "<leader>:d", '<cmd>lua require("dapui").toggle()<cr>', { silent = true })
