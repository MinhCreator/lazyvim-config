-- local Util = require("ditsuke.utils")
vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4
return {
  {
    "neovim/nvim-lspconfig",
    event = 'VeryLazy',
    -- config = function()
    -- local open_floating_preview = vim.lsp.util.open_floating_preview
    -- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    -- opts = opts or {}
    -- opts.border = opts.border or "rounded" -- Set border to rounded
    -- return open_floating_preview(contents, syntax, opts, ...)
    -- end
    --
    -- require("config.lsp")
    -- end,
    --opts = {
    --  servers = {
    --    pyright = {},
    --  },
    --},
    --config = function()
    --  require("config.lsp")
    --end,

  },

}
