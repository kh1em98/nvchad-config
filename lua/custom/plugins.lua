local overrides = require("custom.configs.overrides")

local plugins = {
  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { 
        "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
          require("telescope").load_extension("live_grep_args")
        end,
      }
    },
    opts = {
     defaults = {
       mappings = {
         i = {
           ["<esc>"] = function(...)
               require("telescope.actions").close(...)
            end,
          },
        },
      },
    },
  },

  {
    "lukas-reineke/lsp-format.nvim",
    opts = overrides.lspformat,
  },
  {
    "lewis6991/hover.nvim", 
    opts = overrides.hover,
  },
  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end,
  },
  {
    'terrortylor/nvim-comment',
  },
  {
    'otavioschwanck/cool-substitute.nvim',
  }
}

return plugins
