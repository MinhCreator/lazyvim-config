local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local icons = require("user.icons").ui
require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim",                 import = "lazyvim.plugins" },
    { "MinhCreator/LazyVim",             import = "lazyvim.plugins" },
    { import = "plugins" },
    { import = "plugins/autocomplete" },
    { import = "plugins/color_theme" },
    { import = "plugins/comment" },
    { import = "plugins/core" },
    { import = "plugins/disable_plugins" },
    { import = "plugins/explorer" },
    { import = "plugins/icon" },
    { import = "plugins/lang" },
    { import = "plugins/lsp" },
    { import = "plugins/search" },
    { import = "plugins/terminal" },
    { import = "plugins/todo_comment" },
    { import = "plugins/treesitter" },
    { import = "plugins/ui_menu" },
    { import = "plugins/debug_adapter" },
    -- import theme and custom plugin configs
  },
  -- install = { colorscheme = {"onedark"} },

  -- automatically check for plugin updates
  checker = {
    enabled = false, -- check for plugin updates periodically
    notify = true,   -- notify on update
  },
  --change_detection = { enabled = false },
  ui = {
    icons = {
      ft = icons.ft,                 --"",
      lazy = icons.Bell,             --"󰂠 ",
      loaded = icons.CheckCircle,    --"",
      not_loaded = icons.not_loaded, --"",
    },
    border = "rounded",
    backdrop = 100,
  },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "lazyredraw",
      },
    },
  },
})
