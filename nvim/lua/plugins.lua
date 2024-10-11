

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

	'rcarriga/nvim-notify',
	'terrortylor/nvim-comment',
	'windwp/nvim-autopairs',
	'folke/which-key.nvim',
	'goolord/alpha-nvim',
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

-- return require('packer').startup(function(use)
--
-- 	use 'wbthomason/packer.nvim'
-- 	use 'rcarriga/nvim-notify'
-- 	use 'terrortylor/nvim-comment'
-- 	use 'windwp/nvim-autopairs'
-- 	use 'folke/which-key.nvim'
--         use 'lervag/vimtex'
-- 	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
-- 	use { 
-- 	        'nvim-telescope/telescope-fzf-native.nvim', 
-- 	        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
-- 	}
-- 	use {
-- 		'nvim-telescope/telescope.nvim',
-- 		requires = {
-- 			'nvim-lua/plenary.nvim',
-- 			'nvim-tree/nvim-web-devicons',
-- 		},
-- 	}
-- 	use {
-- 		'goolord/alpha-nvim',
-- 		requires = 'nvim-tree/nvim-web-devicons',
-- 	}
-- 	use {
-- 		'nvim-tree/nvim-tree.lua',
-- 		requires = 'nvim-tree/nvim-web-devicons',      -- optional, for file icons
-- 		-- tag = 'nightly'
-- 	}
--         use {
--                 "L3MON4D3/LuaSnip",
--                 tag = "v2.*",   -- Replace <CurrentMajor> by the latest released major (first number of latest release)
--                 run = "make install_jsregexp",  -- optional
--                 requires = "rafamadriz/friendly-snippets",
--         }
--         use {
--                 'nvim-lualine/lualine.nvim',
--                 requires = 'nvim-tree/nvim-web-devicons',
--         }
--         use {
--                 'akinsho/bufferline.nvim', 
--                 tag = "*", 
--                 requires = 'nvim-tree/nvim-web-devicons'
--         }
--         use { 'ellisonleao/gruvbox.nvim', as = 'gruvbox' }
--         use { 'arcticicestudio/nord-vim', as = 'nord' }
--         use { 'rose-pine/neovim', as = 'rose-pine' }
--
-- 	if packer_bootstrap then
-- 		require('packer').sync()
-- 	end
-- end)
