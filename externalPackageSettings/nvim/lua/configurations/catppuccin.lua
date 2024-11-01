

-- configurations/catppuccin.lua


-- local time = { dawn = 620, night = 1900, now = tonumber(vim.fn.strftime('%H%M')), }     -- TODO To automatically change the theme

-- if time.dawn <= time.now and time.now < time.night then
        -- vim.o.bg = 'light'
-- else
        -- vim.o.bg = 'dark'
-- end

require("catppuccin").setup({
        integrations = {
                cmp = true,
                nvimtree = true,
                treesitter = true,
                -- whichkey = true,
        }
})

-- Set colorscheme after options

vim.cmd.colorscheme('rose-pine')
