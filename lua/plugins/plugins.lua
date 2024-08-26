local plugins = {
  --{
  --  "ahmedkhalf/project.nvim",
  --},
  --{
  --  "nvim-tree/nvim-tree.lua",
  --},
  {
    "nvim-lua/popup.nvim",
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "mypy",
        "pyright",
      },
    },
  },
}
return plugins
