-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--show path
vim.keymap.set("n", "<leader>p", "<cmd>:echo expand('%:p')<cr>", { noremap = true, silent = false, desc = "Show path" })
vim.keymap.set("n", "<leader>o", "<cmd> Neotree focus<cr>", { noremap = true, silent = false, desc = "focus explorer" })
-- Add keymap for compiler

-- Open compiler
vim.api.nvim_set_keymap("n", "<F6>", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true, desc = "Open compiler" })

-- Redo last selected option
vim.api.nvim_set_keymap(
  "n",
  "<S-F6>",
  "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
  .. "<cmd>CompilerRedo<cr>",
  { noremap = true, silent = true, desc = "Stop compiler and redo" }
)

-- Toggle compiler results
vim.api.nvim_set_keymap(
  "n",
  "<S-F7>",
  "<cmd>CompilerToggleResults<cr>",
  { noremap = true, silent = true, desc = "Toggle compiler results" }
)

vim.api.nvim_set_keymap("n", "<C-tab>", "<cmd> buffer <cr>", { noremap = true, silent = true, desc = "Go to buffer" })

-- add toggle cmdline
vim.keymap.set("n", "<S><S>", "<cmd> :", { noremap = true, silent = true, desc = "Toggle cmdline" })

-- add toggle home screen
vim.keymap.set("n", "<C-a>", "<cmd>Alpha<cr>", { noremap = true, desc = "Toggle home screen" })

-- add keymap for file browser

-- open file_browser with the path of the current buffer
vim.keymap.set(
  "n",
  "<C-S-e>",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { noremap = true, desc = "Open file browser", silent = true }
)

vim.keymap.set("n", "<space>n", ":Telescope resume<cr>", { noremap = true, desc = "Resume last action", silent = true })

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
