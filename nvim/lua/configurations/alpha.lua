

-- configurations/alpha.lua


-- vim.api.nvim_create_autocmd({ 'BufNew' }, {
--         pattern = '*',
--         command = 'Alpha',
-- })

require('alpha').setup(
        require 'alpha.themes.dashboard'.config
)
