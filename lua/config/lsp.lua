local fn = vim.fn
local api = vim.api
local keymap = vim.keymap
local lsp = vim.lsp
local diagnostic = vim.diagnostic

local utils = require("plugins/utils.utils")


-- set quickfix list from diagnostics in a certain buffer, not the whole workspace
local set_qflist = function(buf_num, severity)
  local diagnostics = nil
  diagnostics = diagnostic.get(buf_num, { severity = severity })

  local qf_items = diagnostic.toqflist(diagnostics)
  vim.fn.setqflist({}, " ", { title = "  Diagnostics", items = qf_items })

  -- open quickfix by default
  vim.cmd([[copen]])
end

local custom_attach = function(client, bufnr)
  -- Mappings.
  local map = function(mode, l, r, opts)
    opts = opts or {}
    opts.silent = true
    opts.buffer = bufnr
    keymap.set(mode, l, r, opts)
  end

  map("n", "gd", vim.lsp.buf.definition, { desc = "go to definition", noremap = true, silent = true })
  --map("n", "<C-]>", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "go to definition" })
  map("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "show hover" })
  map("n", "<C-k>", vim.lsp.buf.signature_help, { noremap = true, silent = true, desc = "show signature help" })
  map("n", "<space>rn", vim.lsp.buf.rename, { desc = "varialbe rename", noremap = true, silent = true })
  map("n", "gr", vim.lsp.buf.references, { desc = "show references", noremap = true, silent = true })
  map("n", "[d", diagnostic.goto_prev, { desc = "previous diagnostic", noremap = true, silent = true })
  map("n", "]d", diagnostic.goto_next, { desc = "next diagnostic", noremap = true, silent = true })
  -- this puts diagnostics from opened files to quickfix
  map("n", "<space>qw", diagnostic.setqflist, { desc = "put window diagnostics to qf", noremap = true, silent = true })
  -- this puts diagnostics from current buffer to quickfix
  map("n", "<space>qb", function()
    set_qflist(bufnr)
  end, { desc = "put buffer diagnostics to qf", noremap = true, silent = true })
  map("n", "<space>ca", vim.lsp.buf.code_action, { desc = "LSP code action", noremap = true, silent = true })
  map(
    "n",
    "<space>wa",
    vim.lsp.buf.add_workspace_folder,
    { desc = "add workspace folder", noremap = true, silent = true }
  )
  map(
    "n",
    "<space>wr",
    vim.lsp.buf.remove_workspace_folder,
    { desc = "remove workspace folder", noremap = true, silent = true }
  )
  map("n", "<space>wl", function()
    vim.print(vim.lsp.buf.list_workspace_folders())
  end, { desc = "list workspace folder", noremap = true, silent = true })

  -- Set some key bindings conditional on server capabilities
  if client.server_capabilities.documentFormattingProvider then
    map("n", "<space>f", vim.lsp.buf.format, { desc = "format code", noremap = true, silent = true })
  end

  api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local float_opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always", -- show source in diagnostic popup window
        prefix = " ",
      }

      if not vim.b.diagnostics_pos then
        vim.b.diagnostics_pos = { nil, nil }
      end

      local cursor_pos = api.nvim_win_get_cursor(0)
      if
          (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
          and #diagnostic.get() > 0
      then
        diagnostic.open_float(nil, float_opts)
      end

      vim.b.diagnostics_pos = cursor_pos
    end,
  })

  -- The blow command will highlight the current variable and its usages in the buffer.
  if client.server_capabilities.documentHighlightProvider then
    vim.cmd([[
      hi! link LspReferenceRead Visual
      hi! link LspReferenceText Visual
      hi! link LspReferenceWrite Visual
    ]])

    local gid = api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    api.nvim_create_autocmd("CursorHold", {
      group = gid,
      buffer = bufnr,
      callback = function()
        lsp.buf.document_highlight()
      end,
    })

    api.nvim_create_autocmd("CursorMoved", {
      group = gid,
      buffer = bufnr,
      callback = function()
        lsp.buf.clear_references()
      end,
    })
  end

  if vim.g.logging_level == "debug" then
    local msg = string.format("Language server %s started!", client.name)
    vim.notify(msg, vim.log.levels.DEBUG, { title = "Nvim-config" })
  end

  local navic = require("nvim-navic")

  navic.attach(client, bufnr)

  -- navic.custom_attach(client, bufnr)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- required by nvim-ufo
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

local lspconfig = require("lspconfig")
-- gdscript language server

local gdscript_config = {
  on_attach = custom_attach,
  capabilities = capabilities,
  settings = {}
}
if vim.fn.has 'win32' == 1 then
  -- Windows specific. Requires nmap installed (`winget install nmap`)
  gdscript_config['cmd'] = { "ncat", "127.0.0.1", os.getenv("GDScript_Port") or "6005" }
end

lspconfig.gdscript.setup(gdscript_config)

-- gdshader language server
lspconfig.gdshader.setup({
  on_attach = custom_attach,
  capabilities = capabilities,
  settings = {
    gdscript = {
      enable = true,
      plugins = {
        gdtoolkit = {
          enable = true
        },
      },
    },
    gdshader = {
      enable = true
    },
  }
})

-- pyright language server
lspconfig.pyright.setup({
  on_attach = custom_attach,
  settings = {
    pyright = {
      plugins = {
        -- formatter options
        black = { enabled = true },
        autopep8 = { enabled = true },
        yapf = { enabled = false },
        -- linter options
        pylint = { enabled = true, executable = "pylint" },
        ruff = { enabled = true },
        pyflakes = { enabled = false },
        pycodestyle = { enabled = false },
        -- type checker
        pylsp_mypy = {
          enabled = true,
          report_progress = true,
          live_mode = true,
        },
        -- auto-completion options
        jedi_completion = { fuzzy = true },
        -- import sorting
        isort = { enabled = true },
      },
    },
  },
  flags = {
    debounce_text_changes = 200,
  },
  capabilities = capabilities,
})

if utils.executable("ruff_lsp") then
  lspconfig.ruff_lsp.setup({

    on_attach = custom_attach,

    capabilities = capabilities,

  })
else
  vim.notify("ruff_lsp not found!", vim.log.levels.WARN, { title = "Nvim-config" })
end

if utils.executable("pylsp") then
  lspconfig.pylsp.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
  })
else
  vim.notify("pylsp not found!", vim.log.levels.WARN, { title = "Nvim-config" })
end

if utils.executable("pyright") then
  lspconfig.pyright.setup({
    on_attach = custom_attach,
    capabilities = capabilities,
  })
else
  vim.notify("pyright not found!", vim.log.levels.WARN, { title = "Nvim-config" })
end

if utils.executable("lua-language-server") then
  -- settings for lua-language-server can be found on https://github.com/LuaLS/lua-language-server/wiki/Settings .
  lspconfig.lua_ls.setup({
    on_attach = custom_attach,
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
        },
      },
    },
    capabilities = capabilities,
  })
else
  vim.notify("lua_lsp not found!", vim.log.levels.WARN, { title = "Nvim-config" })
end



-- Change diagnostic signs.
fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })


diagnostic.config({
  underline = false,
  virtual_text = true,
  signs = true, --{active = signs,},
  -- update_in_insert = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    -- border = "rounded",
    source = "always",
    -- header = "",
    -- prefix = ""
  }, --"single" },
})
