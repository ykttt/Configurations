-- lua/plugins.lua
--
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

return require("lazy").setup({
  "hiphish/rainbow-delimiters.nvim",
  "terrortylor/nvim-comment",
  "saadparwaiz1/cmp_luasnip",
  "neovim/nvim-lspconfig",
  "rebelot/kanagawa.nvim",
  "stevearc/conform.nvim",
  "windwp/nvim-autopairs",
  "folke/which-key.nvim",
  "hrsh7th/cmp-nvim-lsp",
  "rcarriga/nvim-notify",
  "hrsh7th/cmp-cmdline",
  "petertriho/cmp-git",
  "hrsh7th/cmp-buffer",
  "micangl/cmp-vimtex",
  "hrsh7th/cmp-path",
  "hrsh7th/nvim-cmp",
  "lervag/vimtex",
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^4", -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
    },
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "mfussenegger/nvim-dap-python",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "Bekaboo/dropbar.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  {
    "L3MON4D3/LuaSnip",
    -- tag = "v2.*",   -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    build = "make install_jsregexp", -- optional
    dependencies = "rafamadriz/friendly-snippets",
  },
  {
    "savq/melange-nvim",
    name = "melange",
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
  {
    "goolord/alpha-nvim",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      -- math.randomseed(os.time())
      -- local function pick_colour()
      --   local colours = {"String", "Identifier", "Keyword", "Number"}
      --   return colours[math.random(#colours)]
      -- end
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
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀           ",
        "⠀Have a nice dream today.⠀ ",
      }
      dashboard.section.header.val = logo
      dashboard.section.header.opts.hl = "Identifier"
      -- dashboard.section.header.opts.hl = "Function"
      dashboard.section.buttons.val = {
        dashboard.button("SPACE f f", "  Find It"),
        dashboard.button("SPACE f h", "  I Remember You"),
        dashboard.button("SPACE   a", "  One More Thing"),
        dashboard.button("SPACE   p", "  I'm a Bit Lazy..."),
      }

      -- dashboard.section.footer.val = "⠀Have a nice dream today.⠀ "
      -- dashboard.section.footer.opts.hl = "Comment"
      alpha.setup(dashboard.opts)
      vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
  },
})
