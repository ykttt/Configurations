-- configurations/catppuccin.lua
--
require("catppuccin").setup({
  flavour = "auto",
  background = {
    light = "latte",
    dark = "macchiato",
  },
  transparent_background = false, -- disables setting the background color.
  show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
  term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
    enabled = true, -- dims the background color of inactive window
    shade = "dark",
    percentage = 0.05, -- percentage of the shade to apply to the inactive window
  },
  no_italic = false, -- Force no italic
  no_bold = false, -- Force no bold
  no_underline = false, -- Force no underline
  styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" }, -- Change the style of comments
    conditionals = { "underdouble" },
    loops = { "underdashed" },
    functions = { "italic" },
    keywords = { "bold" },
    strings = {},
    variables = { "italic" },
    numbers = {},
    booleans = { "italic" },
    properties = {},
    types = {},
    operators = {},
  },
  default_integrations = true,
  integrations = {
    cmp = true,
    nvimtree = true,
    treesitter = true,
  },
})
vim.cmd.colorscheme("catppuccin")
