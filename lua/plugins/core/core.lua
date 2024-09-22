return {

  -- add extras packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.python" },
  { "j-hui/fidget.nvim",                          enabled = false },
  { "nvim-lua/popup.nvim" },
  { "brenoprata10/nvim-highlight-colors",         lazy = true },
  { "stevearc/conform.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim",   build = "make", lazy = true },
  { "mg979/vim-visual-multi",                     lazy = true },
  { import = "lazyvim.plugins.extras.vscode" },
  { "nvim-neotest/nvim-nio",                      lazy = true },

  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },

    config = function()
      require("plugins/search.search")
    end,
  },

  -- change trouble config
  {
    "folke/trouble.nvim",
    lazy = true,
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },



  -- override nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    dependencies = {
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-buffer",  -- buffer completions
      "hrsh7th/cmp-path",    -- path completions
      "hrsh7th/cmp-cmdline", -- cmdline completions
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-calc",
      "L3MON4D3/LuaSnip",
    },

    opts = function(_, opts)
      opts.auto_brackets = opts.auto_brackets or {}
      table.insert(opts.auto_brackets, "python")
      table.insert(opts.auto_brackets, "lua")
      table.insert(opts.auto_brackets, "json")
      local icon_menu = require("user.icons").ui
      local icon = require("user.icon_cmp")
      opts.formatting = {
        format = function(entry, vim_item)
          -- Kind icons
          vim_item.kind = string.format("%s %s", icon[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
          -- Source
          vim_item.menu = ({
            buffer = "(Buffer)",
            nvim_lsp = "(LSP)",
            luasnip = "(LuaSnip)",
            nvim_lua = "(Lua)",
            latex_symbols = "(LaTeX)",
          })[entry.source.name]

          if entry.source.name == "calc" then
            vim_item.kind = icon.Calc
            -- return vim_item
          end

          return vim_item
        end,
      }
      opts.sources = {
        { name = "nvim_lsp" },
        { name = "lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "crates" },
        { name = "calc" },
        -- { name = "luasnip" },
      }
      opts.window = {
        completion = {
          border = icon_menu.Border,
          scrollbar = "",
        },
        documentation = {
          border = nil, --icon_menu.Border,
          -- scrollbar = nil,
        },
      }
    end,
  },
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    build = ":TSUpdate",
    event = "VeryLazy",

    opts = {
      ensure_installed = {
        --"json",
        "lua",
        --"markdown",
        --"markdown_inline",
        "python",
      },
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      auto_install = true, -- automatically install syntax support when entering new file type buffer
    },
    config = function(_, opts)
      local configs = require("nvim-treesitter.configs")
      configs.setup(opts)
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins/ui_menu.lualine")
    end,
  },
  --Add linter
  {
    "mfussenegger/nvim-lint",
    lazy = true,
    event = {
      "BufReadPre",
      "BufNewFile",
      "VeryLazy",
    },
    config = function()
      --require("plugins/lsp.formater_and_linter")
      --require("plugins/ui_menu.lualine")
      local lint = require("lint")

      local lint_group = vim.api.nvim_create_augroup("Linter", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_group,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  --add more formater
  {
    "stevearc/conform.nvim",
    -- config = function()
    --   require("plugins/lsp.formater_and_linter")
    -- end,
  },

  -- Add lsp and formater, linter
  {
    "williamboman/mason.nvim",
    lazy = true,
    opts = {
      ensure_installed = {
        "black",
        "mypy",
        "pyright",
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "autopep8",
        --"gdtoolkit",
        "ruff",
      },
    },
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
    "rcarriga/nvim-notify",
    config = function()
      require("plugins/ui_menu.notify")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    config = function()
      require("treesitter-context").setup({
        max_lines = 5,
      })
    end,
  },

  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    config = function()
      require("illuminate")
    end,
  },

  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter", "VeryLazy" },
    config = function()
      require("plugins.brackets_pair.auto_pairs")
    end,
    opts = {
      fastwrap = {
        check_comma = true,
        highlight = "PmenuSel",
        map = "<M-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = ([[ [%'%"%)%>%]%)%}%,] ]]):gsub("%s+", ""),
        offset = 0,
        end_key = "$",
        keys = "qwertyuiopzxcvbnmasdfghjkl",
        highlight_grey = "LineNr",
      },
      disable_filetype = { "TelescopePrompt", "spectre_panel" },
      disable_in_macro = true,        -- disable when recording or executing a macro
      disable_in_visualblock = false, -- disable when insert after visual block mode
      disable_in_replace_mode = true,
      ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
      enable_moveright = true,
      enable_afterquote = true,         -- add bracket pairs after quote
      enable_check_bracket_line = true, --- check bracket in same line
      enable_bracket_in_quote = true,   --
      enable_abbr = false,              -- trigger abbreviation
      break_undo = true,                -- switch for basic rule break undo sequence
      map_cr = true,
      map_bs = true,                    -- map the <BS> key
      map_c_h = false,                  -- Map the <C-h> key to delete a pair
      map_c_w = false,                  -- map <c-w> to delete a pair if possible
      check_ts = true,
      ts_config = {
        python = true,
      },
      fast_wrap = {},
    },
  },

  -- Add compiler
  { -- This plugin
    "Zeioth/compiler.nvim",
    event = "VeryLazy",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
    opts = {},
  },

  { -- The task runner we use
    "stevearc/overseer.nvim",
    event = "VeryLazy",
    commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
  },
  {
    "linrongbin16/lsp-progress.nvim",
    lazy = true,
    config = function()
      require("plugins/ui_menu.lualine")
      require("plugins/lsp.lsp_progress")
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    event = "VeryLazy",
    branch = "regexp", -- Use this branch for the new version
    cmd = "VenvSelect",
    enabled = function()
      return LazyVim.has("telescope.nvim")
    end,
    opts = {
      settings = {
        options = {
          notify_user_on_venv_activation = true,
        },
      },
    },
    --  Call config for python files and load the cached venv automatically
    ft = "python",
    keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" } },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = true,
    dependencies = {
      { "nvim-lua/plenary.nvim",       lazy = true },
      { "MunifTanjim/nui.nvim",        lazy = true },
      { "nvim-tree/nvim-web-devicons", lazy = true },
    },
    opts = function()
      --require("plugins/explorer.neo-tree").setup()
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins/terminal.toggleTerm")
      -- require("toggleterm").setup()
    end,
  },
  --Add indent rainbow
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    dependencies = {
      "TheGLander/indent-rainbowline.nvim",
    },
    opts = function(_, opts)
      require("indent-rainbowline").make_opts(opts, {
        color_transparency = 0.05,
      })
    end,
  },
  {
    "LunarVim/bigfile.nvim",
    lazy = true,
    event = "BufReadPre",
    opts = {
      filesize = 2, -- size of the file in MiB, the plugin round file sizes to the closest MiB
    },
    config = function(_, opts)
      require("bigfile").setup(opts)
    end,
  },
}
