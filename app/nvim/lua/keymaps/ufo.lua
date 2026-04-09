-- keymaps/init.lua
--
local k = vim.keymap
k.set("n", "zR", require("ufo").openAllFolds)
k.set("n", "zM", require("ufo").closeAllFolds)
k.set("n", "zr", require("ufo").openFoldsExceptKinds)
k.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
k.set("n", "K", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then
    -- choose one of coc.nvim and nvim lsp
    vim.fn.CocActionAsync("definitionHover") -- coc.nvim
    vim.lsp.buf.hover()
  end
end)
