-- keymaps/neovim.lua
--
vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set("n", "<leader>t", "<cmd>tabe<cr>", { silent = true })
vim.keymap.set("n", "<leader>h", "<cmd>tabp<cr>", { silent = true })
vim.keymap.set("n", "<leader>l", "<cmd>tabn<cr>", { silent = true })

vim.keymap.set("n", "<leader>k", "<cmd>bp<cr>", { silent = true })
vim.keymap.set("n", "<leader>j", "<cmd>bn<cr>", { silent = true })
vim.keymap.set("n", "<leader>K", "<cmd>bf<cr>", { silent = true })
vim.keymap.set("n", "<leader>J", "<cmd>bl<cr>", { silent = true })
vim.keymap.set("n", "<leader>d", "<cmd>bd<cr>", { silent = true })

vim.keymap.set("n", "<leader>u", "<cmd>up<cr>", { silent = true })
vim.keymap.set("n", "<leader>q", "<cmd>q!<cr>", { silent = true })
vim.keymap.set("n", "<leader>Q", "<cmd>qa!<cr>", { silent = true })
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { silent = true })
vim.keymap.set("n", "<leader>W", "<cmd>wq<cr>", { silent = true })

vim.keymap.set("n", "<leader>+", "<cmd>res +1<cr>", { silent = true })
vim.keymap.set("n", "<leader>-", "<cmd>res -1<cr>", { silent = true })
vim.keymap.set("n", "<leader>,", "<cmd>vert res +1<cr>", { silent = true })
vim.keymap.set("n", "<leader>.", "<cmd>vert res -1<cr>", { silent = true })

vim.keymap.set("n", "<leader>m", function()
  vim.o.bg = "light"
end, { silent = true })
vim.keymap.set("n", "<leader>n", function()
  vim.o.bg = "dark"
end, { silent = true })

vim.keymap.set("n", "<leader>p", "<cmd>Lazy<cr>", { silent = true })

vim.keymap.set("n", "<leader>:", "<cmd>sp term://zsh<cr>", { silent = true })

vim.keymap.set("!", "<c-h>", "<left>")
vim.keymap.set("!", "<c-l>", "<right>")
vim.keymap.set("!", "<c-bs>", "<esc>bdei")

vim.keymap.set({ "t", "i" }, "<a-h>", "<c-\\><c-n><c-w>h", { silent = true })
vim.keymap.set({ "t", "i" }, "<a-j>", "<c-\\><c-n><c-w>j", { silent = true })
vim.keymap.set({ "t", "i" }, "<a-k>", "<c-\\><c-n><c-w>k", { silent = true })
vim.keymap.set({ "t", "i" }, "<a-l>", "<c-\\><c-n><c-w>l", { silent = true })

vim.keymap.set("n", "<a-h>", "<c-w>h", { silent = true })
vim.keymap.set("n", "<a-j>", "<c-w>j", { silent = true })
vim.keymap.set("n", "<a-k>", "<c-w>k", { silent = true })
vim.keymap.set("n", "<a-l>", "<c-w>l", { silent = true })
