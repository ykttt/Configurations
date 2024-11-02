

-- lua/plugins.lua

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
  }, {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  }, {
    -- 'shaunsingh/nord.nvim',
    -- name = 'nord',
    -- config = function()
    --   vim.g.nord_contrast = true
    --   vim.g.nord_borders = true
    --   vim.g.nord_disable_background = false
    --   vim.g.nord_italic = true
    --   vim.g.nord_uniform_diff_background = true
    --   vim.g.nord_bold = true
    --   require('nord').set()
    -- end
  -- }, {
    'goolord/alpha-nvim',
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      math.randomseed(os.time())
      local function pick_colour()
      local colours = {"String", "Identifier", "Keyword", "Number"}
      return colours[math.random(#colours)]
      end
      local logo = {
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⠹⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⠀⠀⢀⡠⠖⠋⠁⠀⠀⠘⠲⠤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
        "⠀⠀⠀⠀⢀⡴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠲⢤⡀⠀⢀⣠⡄⠀",
        "⠀⠀⣠⠴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠉⠀⡇⠀",
        "⢀⡴⠋⠀⠀⠀⠀⣀⣿⠂⣆⣠⡀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⠃⠀",
        "⣾⠀⠀⠀⠀⠀⡀⠀⠁⠀⠀⠈⠙⠁⠀⠀⣴⠄⠀⠀⠀⠀⠀⠀⣾⠀⠀",
        "⠻⠦⠤⠴⠖⠋⠉⠓⠒⠶⠤⣄⣀⡀⠀⠐⠺⡂⠀⠀⠀⠀⠀⠀⠘⣆⠀",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠙⠓⡾⠁⠀⠀⠀⠀⢀⠀⠀⠹⡆",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠷⢤⣤⠤⠴⠚⠛⠒⠦⢤⣷",
      }
      dashboard.section.header.val = logo
      dashboard.section.header.opts.hl = pick_colour()
      dashboard.section.buttons.val = {
        dashboard.button("SPACE f f", "  Find It"),
        dashboard.button("SPACE f h", "  I Remember You"),
        dashboard.button("SPACE   a", "  One More Thing"),
        dashboard.button("SPACE   p", "  I'm a Bit Lazy..."),
      }
      -- dashboard.section.footer.val = "Surprisingly I'm still alive..."
      -- dashboard.section.footer.opts.hl = "Constant"
      alpha.setup(dashboard.opts)
      vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
    end
  },
})
