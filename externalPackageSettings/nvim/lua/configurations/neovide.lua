

-- configurations/neovide.lua


if vim.g.neovide then
        vim.o.guifont = 'Sarasa Term J:h13'
        -- vim.g.neovide_transparency = 0.97
        vim.g.neovide_floating_blur_amount_x = 2.0
        vim.g.neovide_floating_blur_amount_y = 2.0
        vim.g.neovide_hide_mouse_when_typing = true
        vim.g.neovide_underline_automatic_scaling = true
        vim.g.neovide_theme = 'auto'
        vim.g.neovide_cursor_trail_sive = 0.6
        vim.g.neovide_cursor_vfx_mode = 'sonicboom'             -- railgun, torpedo, pixeldust, sonicboom, ripple, wireframe
        vim.g.neovide_cursor_vfx_particle_curl = 1.0
        vim.g.neovide_remember_window_size = true
        vim.g.neovide_fullscreen = false
end
