

-- plugins.lua (⊙ˍ⊙)


-- Bootstrap

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
        vim.fn.system({
                "git",
                "clone",
                "--filter=blob:none",
                "https://github.com/folke/lazy.nvim.git",
                "--branch=stable", -- latest stable release
                lazypath,
        })
end

vim.opt.rtp:prepend(lazypath)
vim.g.configpath = "~/.config/nvim"

return require('lazy').setup({

	'terrortylor/nvim-comment',
        'saadparwaiz1/cmp_luasnip',
        'neovim/nvim-lspconfig',
	'windwp/nvim-autopairs',
	'folke/which-key.nvim',
        'hrsh7th/cmp-nvim-lsp',
	'rcarriga/nvim-notify',
        'hrsh7th/cmp-cmdline',
        'petertriho/cmp-git',
	'goolord/alpha-nvim',
        'hrsh7th/cmp-buffer',
        'micangl/cmp-vimtex',
        'hrsh7th/cmp-path',
        'hrsh7th/nvim-cmp',
        'lervag/vimtex',
        {
                'nvim-telescope/telescope.nvim',
                dependencies = {
	                'nvim-lua/plenary.nvim',
                        'nvim-tree/nvim-web-devicons',
                },
        }, {
	        'nvim-tree/nvim-tree.lua',
                dependencies = 'nvim-tree/nvim-web-devicons',
        }, {
                'nvim-lualine/lualine.nvim',
                dependencies = 'nvim-tree/nvim-web-devicons',
        }, {
                "akinsho/bufferline.nvim",
                dependencies = "nvim-tree/nvim-web-devicons",
        }, {
	        'nvim-treesitter/nvim-treesitter',
                tag = 'v0.9.1',
	        build = ':TSUpdate',
	}, {
	        'nvim-telescope/telescope-fzf-native.nvim',
	        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
	}, {
                "L3MON4D3/LuaSnip",
                -- tag = "v2.*",   -- Replace <CurrentMajor> by the latest released major (first number of latest release)
                build = "make install_jsregexp",  -- optional
                dependencies = 'rafamadriz/friendly-snippets',
        }, {
                'rose-pine/neovim',
                name = 'rose-pine',
        },

})
