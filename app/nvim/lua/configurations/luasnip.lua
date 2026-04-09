-- configurations/luasnip.lua
--
require("luasnip").config.set_config({
  enable_autosnippets = true, -- Enable autotriggered snippets
  store_selection_keys = "<Tab>", -- Use Tab (or some other key if you prefer) to trigger visual selection
  update_events = "TextChanged,TextChangedI",
})

-- require('luasnip.loaders.from_vscode').lazy_load()
require("luasnip.loaders.from_lua").load({ paths = vim.g.configpath .. "/lua/luasnippets" })
