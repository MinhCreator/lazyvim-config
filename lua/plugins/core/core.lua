


return {
 
  -- add extras packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },
  { "nvim-lua/popup.nvim"},
  { "brenoprata10/nvim-highlight-colors" },
  { "stevearc/conform.nvim" },
  { "mfussenegger/nvim-lint"},
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { "tpope/vim-repeat" },
  { "nvim-telescope/telescope-ui-select.nvim" },
  { "mg979/vim-visual-multi" },
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  { import = "lazyvim.plugins.extras.vscode" },
  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- disable trouble
  --{ "folke/trouble.nvim", enabled = true },

  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- change some telescope options and a keymap to browse plugin files
  --{
  --"nvim-telescope/telescope.nvim",
  --keys = {
  --  -- add a keymap to browse plugin files
  --  -- stylua: ignore
  --  {
  --    "<leader>fp",
  --    function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
  --    desc = "Find Plugin File",
  --  },
  --},
  ---- change some options
  --opts = {
  --  defaults = {
  --    layout_strategy = "horizontal",
  --    layout_config = { prompt_position = "top" },
  --    sorting_strategy = "ascending",
  --    winblend = 0,
  --  },
  --},
  --},

  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
  },

 
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        --"vim",
        --"yaml",
      },
    },
  },

  
  -- the opts function can also be used to change the default opts:
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, "😄")
    end,
  },

  -- or you can return new options to override all the defaults
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        --[[add your custom lualine config here]]
      }
    end,
  },

  -- use mini.starter instead of alpha
  --{ import = "lazyvim.plugins.extras.ui.mini-starter" },

  

  -- Added python formatter
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "mypy",
        "pyright",
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = { "Neotree" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        filesystem = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = true,
          },
        },
      })
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      routes = {
        {
          filter = { event = "notify", find = "No information available" },
          opts = { skip = true },
        },
      },
      presets = {
        lsp_doc_border = true,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        max_lines = 5,
      })
    end,
  },
 
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate")
    end,
  },
  
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      jump = {
        autojump = true,
      },
      modes = {
        char = {
          jump_labels = true,
          multi_line = false,
        },
      },
    },
     -- stylua: ignore
     keys = {
       { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
       { "S",     mode = { "n" },           function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
       { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
       { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
       { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
     },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "python",
          "lua",
          "vim",
          "vimdoc",
          "json",
          "markdown",
        },
      })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  },
  
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        config = function(_, opts)
          local dap = require("dap")
          local dapui = require("dapui")
          dap.set_log_level("INFO")
          dapui.setup(opts)
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open({})
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close({})
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close({})
          end
        end,
      },
    },
  },
  
  {
    "mfussenegger/nvim-dap-python",
    config = function()
      require("dap-python").setup("python")
    end,
  },
  
  {
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
    },
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = "mason.nvim",
      cmd = { "DapInstall", "DapUninstall" },
      opts = {
        automatic_installation = true,
        handlers = {},
        ensure_installed = {
          "delve",
        },
      },
    },
  },

  {
    "voldikss/vim-floaterm",
    config = function()
      vim.keymap.set(
        "n",
        "<leader>ft",
        "<cmd>:FloatermNew --height=0.7 --width=0.8 --wintype=float --name=floaterm1 --position=center --autoclose=2<CR>",
        { desc = "Open FloatTerm" }
      )
      vim.keymap.set("n", "<leader>flt", "<cmd>:FloatermToggle<CR>", { desc = "Toggle FloatTerm" })
      vim.keymap.set("t", "<leader>flt", "<cmd>:FloatermToggle<CR>", { desc = "Toggle FloatTerm" })
    end,
  },
}

