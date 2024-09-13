local icons = LazyVim.config.icons

return {

  -- add extras packages, and setup treesitter for json, json5 and jsonc
  --{ import = "lazyvim.plugins.extras.lang.json" },
  -- { import = "lazyvim.plugins.extras.lsp.none-ls" },
  --{ "yetone/avante.nvim" },
  { import = "lazyvim.plugins.extras.lang.python" },
  { "j-hui/fidget.nvim",                           enabled = false },
  { "nvim-lua/popup.nvim" },
  { "brenoprata10/nvim-highlight-colors" },
  { "stevearc/conform.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim",    build = "make" },
  --{ "tpope/vim-repeat" },
  { "nvim-telescope/telescope-ui-select.nvim" },
  { "mg979/vim-visual-multi" },
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  { import = "lazyvim.plugins.extras.vscode" },
  { "nvim-neotest/nvim-nio" },

  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },



  -- override nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "hrsh7th/cmp-emoji" },
    },
    ---@class opts cmp.ConfigSchema
    ---@param opts cmd.ConfigSchema
    opts = function(_, opts)
      opts.auto_brackets = opts.auto_brackets or {}
      table.insert(opts.auto_brackets, "python")
      table.insert(opts.sources, { name = "emoji" })
    end,
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
    --config = function()
    --  --require("plugins/lsp.formater_and_linter")
    --  --require("plugins/ui_menu.lualine")
    --end,
    --opts = {
    --  formatters_by_ft = {
    --    lua = { "stylua" },
    --    -- Conform will run multiple formatters sequentially
    --    python = { "black", "autopep8", "ruff_format" },
    --    -- You can customize some of the format options for the filetype (:help conform.format)
    --
    --    format_on_save = {
    --      -- These options will be passed to conform.format()
    --      timeout_ms = 500,
    --      lsp_format = "fallback",
    --    },
    --    format_after_save = {
    --      lsp_format = "fallback",
    --    },
    --    notify_on_error = true,
    --    -- Conform will notify you when no formatters are available for the buffer
    --    notify_no_formatters = true,
    --  },
  },

  --add more formater
  {
    "stevearc/conform.nvim",
    --config = function()
    --  --require("plugins/lsp.formater_and_linter")
    --end,
  },

  -- Add lsp and formater, linter
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

    config = function()
      --require("plugins/overwrite.notify_animation")
    end,
  },

  --{
  --  "nvim-treesitter/nvim-treesitter-context",
  --  config = function()
  --    require("treesitter-context").setup({
  --      max_lines = 5,
  --    })
  --  end,
  --},

  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate auto_install",
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
    event = "InsertEnter",
    opts = {
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
      check_ts = false,
      map_cr = true,
      map_bs = true,   -- map the <BS> key
      map_c_h = false, -- Map the <C-h> key to delete a pair
      map_c_w = false, -- map <c-w> to delete a pair if possible
    },
  },

  -- Add compiler
  { -- This plugin
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
    opts = {},
  },

  { -- The task runner we use
    "stevearc/overseer.nvim",
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
    config = function()
      require("plugins/ui_menu.lualine")
      require("plugins/lsp.lsp_progress")
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
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
}
