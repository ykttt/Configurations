

-- configurations/bufferline.lua

vim.opt.termguicolors = true
local bufferline = require('bufferline')
local highlights = require("catppuccin.groups.integrations.bufferline").get()
-- local highlights = require("nord").bufferline.highlights({
--         italic = true,
--         bold = true,
--         fill = "#181c24",
-- })
bufferline.setup {
    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        -- separator_style = "slant",
        separator_style = "thin",
        buffer_close_icon = '󰅖',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 18,
    },
        highlights = highlights,
}
