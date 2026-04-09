-- keymaps/neovim.lua
--
--
local k = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = ","

k.set("n", "<leader>t", "<cmd>tabe<cr>", { silent = true })
k.set("n", "<leader>h", "<cmd>tabp<cr>", { silent = true })
k.set("n", "<leader>l", "<cmd>tabn<cr>", { silent = true })

k.set("n", "<leader>k", "<cmd>bp<cr>", { silent = true })
k.set("n", "<leader>j", "<cmd>bn<cr>", { silent = true })
k.set("n", "<leader>K", "<cmd>bf<cr>", { silent = true })
k.set("n", "<leader>J", "<cmd>bl<cr>", { silent = true })
k.set("n", "<leader>d", "<cmd>bd<cr>", { silent = true })

k.set("n", "<leader>u", "<cmd>up<cr>", { silent = true })
k.set("n", "<leader>q", "<cmd>q!<cr>", { silent = true })
k.set("n", "<leader>Q", "<cmd>qa!<cr>", { silent = true })
k.set("n", "<leader>w", "<cmd>w<cr>", { silent = true })
k.set("n", "<leader>W", "<cmd>wq<cr>", { silent = true })

k.set("n", "<leader>+", "<cmd>res +1<cr>", { silent = true })
k.set("n", "<leader>-", "<cmd>res -1<cr>", { silent = true })
k.set("n", "<leader>,", "<cmd>vert res +1<cr>", { silent = true })
k.set("n", "<leader>.", "<cmd>vert res -1<cr>", { silent = true })

k.set("n", "<leader>m", function()
  vim.o.bg = "light"
end, { silent = true })
k.set("n", "<leader>n", function()
  vim.o.bg = "dark"
end, { silent = true })

k.set("n", "<leader>p", "<cmd>Lazy<cr>", { silent = true })

k.set("n", "<leader>:i", "<cmd>sp term://nu<cr>", { silent = true })
k.set("n", "<leader>:o", "<cmd>vs term://nu<cr>", { silent = true })

k.set("!", "<c-h>", "<left>")
k.set("!", "<c-l>", "<right>")
k.set("!", "<c-bs>", "<esc>bdei")

k.set({ "t", "i" }, "<a-h>", "<c-\\><c-n><c-w>h", { silent = true })
k.set({ "t", "i" }, "<a-j>", "<c-\\><c-n><c-w>j", { silent = true })
k.set({ "t", "i" }, "<a-k>", "<c-\\><c-n><c-w>k", { silent = true })
k.set({ "t", "i" }, "<a-l>", "<c-\\><c-n><c-w>l", { silent = true })

k.set("n", "<a-h>", "<c-w>h", { silent = true })
k.set("n", "<a-j>", "<c-w>j", { silent = true })
k.set("n", "<a-k>", "<c-w>k", { silent = true })
k.set("n", "<a-l>", "<c-w>l", { silent = true })
