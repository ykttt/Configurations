

-- configurations/catppuccin.lua


require("catppuccin").setup({
        flavour = "auto",
        background = {
                light = "latte",
                dark = "mocha",
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
                conditionals = { "italic" },
        },
        default_integrations = true,
        integrations = {
                cmp = true,
                nvimtree = true,
                treesitter = true,
        }
})

local time = { dawn = 620, night = 1900, now = tonumber(vim.fn.strftime('%H%M')), }     -- TODO: Automatically change the theme

if time.dawn <= time.now and time.now < time.night then
        vim.o.bg = 'light'
else
        vim.o.bg = 'dark'
end

vim.cmd.colorscheme "catppuccin"
