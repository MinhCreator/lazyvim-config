--pen:
-- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "pyright"
-- Set to "ruff_lsp" to use the old LSP implementation version.
vim.g.lazyvim_python_ruff = "ruff"

-- Enable relative line numbers
vim.opt.nu = true
vim.opt.rnu = false

-- Set tabs to 2 spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Enable auto indenting and set it to spaces
vim.opt.smartindent = true
vim.opt.shiftwidth = 2

-- Enable smart indenting (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
vim.opt.breakindent = true

-- Enable incremental searching
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Disable text wrap
vim.opt.wrap = true

-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better splitting
vim.opt.splitbelow = false
vim.opt.splitright = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Enable ignorecase + smartcase for better searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease updatetime to 250ms
vim.opt.updatetime = 250

-- Set completeopt to have a better completion experience
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Enable persistent undo history
vim.opt.undofile = true

-- Enable 24-bit color
vim.opt.termguicolors = true

-- Enable the sign column to prevent the screen from jumping
vim.opt.signcolumn = "yes"

-- Enable access to System Clipboard
vim.opt.clipboard = "unnamed,unnamedplus"

-- Enable cursor line highlight
vim.opt.cursorline = true

-- Set fold settings
-- These options were reccommended by nvim-ufo
-- See: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.foldcolumn = "0"
vim.opt.foldnestmax = 5
vim.opt.foldtext = ""

-- Always keep 8 lines above/below cursor unless at start/end of file
vim.opt.scrolloff = 8

-- Place a column line
vim.opt.colorcolumn = "80"

--Add AutoSave
local api = vim.api
local fn = vim.fn
local delay = 250 -- ms
local autosave = api.nvim_create_augroup("autosave", { clear = true })

-- Initialization
api.nvim_create_autocmd("BufRead", {
  pattern = "*",
  group = autosave,
  callback = function(ctx)
    api.nvim_buf_set_var(ctx.buf, "autosave_queued", false)
    api.nvim_buf_set_var(ctx.buf, "autosave_block", false)
  end,
})

api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "BufLeave", "FocusLost" }, {
  pattern = "*",
  group = autosave,
  callback = function(ctx)
    -- conditions that donnot do autosave
    local disabled_ft = { "acwrite", "oil" }
    if
        not vim.bo.modified
        or fn.findfile(ctx.file, ".") == "" -- a new file
        or ctx.file:match("wezterm.lua")
        or vim.tbl_contains(disabled_ft, vim.bo[ctx.buf].ft)
    then
      return
    end

    local ok, queued = pcall(api.nvim_buf_get_var, ctx.buf, "autosave_queued")
    if not ok then
      return
    end
    local msg = "File Saved " .. os.date("%H:%M:%S")
    if not queued then
      vim.cmd("silent w")
      api.nvim_buf_set_var(ctx.buf, "autosave_queued", true)
      vim.notify(msg, "warn", { title = "AutoSave  " })
    end

    local block = api.nvim_buf_get_var(ctx.buf, "autosave_block")
    if not block then
      api.nvim_buf_set_var(ctx.buf, "autosave_block", true)
      vim.defer_fn(function()
        if api.nvim_buf_is_valid(ctx.buf) then
          api.nvim_buf_set_var(ctx.buf, "autosave_queued", false)
          api.nvim_buf_set_var(ctx.buf, "autosave_block", false)
        end
      end, delay)
    end
  end,
})
