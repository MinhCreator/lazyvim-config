-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local opts = { noremap = true, silent = true, buffer = 0 }
-- quick change working dir
map("n", "<leader>cd", "<cmd>cd %:h<cr>:pwd<CR>",
  { noremap = true, silent = true, desc = "Change working dir" })

--copy, cut and Paste
map({ "n", "v", "c" }, "<C-v>", '"+p', { silent = false, desc = "Paste text" })
map({ "n", "v", "c" }, "<C-c>", '"+y', { silent = false, desc = "Copy text" })
map({ "n", "v", "c" }, "<C-x>", 'dd', { silent = false, desc = "Cut text" })
-- Open compiler
map("n", "<F6>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true, desc = "Open compiler" })

-- Redo last selected option
map(
  "n",
  "<S-F6>",
  "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
  .. "<cmd>CompilerRedo<cr>",
  { noremap = true, silent = true, desc = "Stop compiler and redo" }
)

--toggle sidebar
map(
  "n",
  "<leader>e",
  "<cmd>SidebarNvimToggle<cr>",
  { noremap = true, silent = true, desc = "Toggle sidebar" })

map(
  "n",
  "<C-S-e>",
  "<cmd>NvimTreeToggle<cr>",
  { noremap = true, silent = true, desc = "Toggle file explorer" }
)


-- Toggle compiler results
map(
  "n",
  "<S-F7>",
  "<cmd>CompilerToggleResults<cr>",
  { noremap = true, silent = true, desc = "Toggle compiler results" }
)

map("n", "<C-tab>", "<cmd> buffer <cr>", { noremap = true, silent = true, desc = "Go to buffer" })



-- add toggle home screen
map("n", "<C-a>", "<cmd>Alpha<cr>", { noremap = true, desc = "Toggle home screen" })

-- add keymap for file browser
-- open file_browser with the path of the current buffer
map(
  "n",
  "<leader>e",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true, desc = "Open file browser", silent = true }
)

-- add extended keymap for file_browser
local fb_actions = require("telescope").extensions.file_browser.actions

require("telescope").setup({
  defaults = { --[[ your defaults]]
  },
  pickers = {
    file_browser = {
      mappings = {
        ["i"] = {},
        ["n"] = {
          ["c"] = fb_actions.create,         -- Create file/folder at current path (trailing path separator creates folder)
          ["r"] = fb_actions.rename,         -- Rename file/folder
          ["<C-c>"] = fb_actions.copy,       -- Copy (multi-)selected files/folders to current path
          ["<leader>d"] = fb_actions.remove, -- Delete (multi-)selected files/folders
          --["<leader>m"] = fb_actions.move,           -- Move (multi-)selected files/folders
          { noremap = true, silent = true, desc = "" },
        },
      },
    },
  },
})