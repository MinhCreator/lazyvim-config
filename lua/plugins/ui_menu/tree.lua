return {
  { "nvim-telescope/telescope-file-browser.nvim" },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "BufWinEnter",
    cmd = "Neotree",
    --keys = {
    --{
    --"<leader>fe",
    --function()
    --require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
    --end,
    --desc = "Explorer NeoTree (cwd)",
    --},
    --{ "<leader>n", "<cmd>Neotree toggle<cr>", desc = "Explorer NeoTree (root dir)", remap = true },
    --{ "<leader>e", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
    --},
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    opts = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = true,
      },
      window = {
        position = "left",
        width = 30,
        mappings = {
          ["<space>"] = "none",
        },
      },
      default_component_configs = {
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "ﰊ",
          -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
          -- then these will never be used.
          default = "*",
          highlight = "NeoTreeFileIcon",
        },
        modified = {
          symbol = "[+]",
          highlight = "NeoTreeModified",
        },
      },
    },
  },
}
