-- keymaps/trouble.lua
--
local k = vim.keymap
k.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { silent = true })
k.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { silent = true })
k.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { silent = true })
k.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { silent = true })
k.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { silent = true })
k.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { silent = true })
