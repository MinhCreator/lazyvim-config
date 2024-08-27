return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  enabled = true,
  init = false,
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    -- Define and set highlight groups for each logo line
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo1", { fg = "#EF476F" })
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo2", { fg = "#F78C6B" })
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo3", { fg = "#FFD166" })
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo4", { fg = "#06D6A0" })
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo5", { fg = "#118AB2" })
    vim.api.nvim_set_hl(0, "NeovimDashboardLogo6", { fg = "#073B4C" })
    --vim.api.nvim_set_hl(0, "NeovimDashboardLogo7", { fg = "#FFFFFF" })
    --vim.api.nvim_set_hl(0, "NeovimDashboardLogo8", { fg = "#FFFFFF" })
    --vim.api.nvim_set_hl(0, "NeovimDashboardLogo9", { fg = "#FFFFFF" })
    vim.api.nvim_set_hl(0, "NeovimDashboardUsername", { fg = "#D1C4E9" })
    dashboard.section.header.type = "group"
    dashboard.section.header.val = {
      {
        type = "text",
        val = "   ██╗      █████╗ ███████╗██╗   ██╗     ██████╗ ██████╗ ██████╗ ███████╗  ",
        opts = { hl = "NeovimDashboardLogo1", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "   ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝    ██╔════╝██╔═══██╗██╔══██╗██╔════╝  ",
        opts = { hl = "NeovimDashboardLogo2", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "   ██║     ███████║  ███╔╝  ╚████╔╝     ██║     ██║   ██║██║  ██║█████╗    ",
        opts = { hl = "NeovimDashboardLogo3", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "   ██║     ██╔══██║ ███╔╝    ╚██╔╝      ██║     ██║   ██║██║  ██║██╔══╝    ",
        opts = { hl = "NeovimDashboardLogo4", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "   ███████╗██║  ██║███████╗   ██║       ╚██████╗╚██████╔╝██████╔╝███████╗  ",
        opts = { hl = "NeovimDashboardLogo5", shrink_margin = false, position = "center" },
      },
      {
        type = "text",
        val = "   ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝        ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝  ",
        opts = { hl = "NeovimDashboardLogo6", shrink_margin = false, position = "center" },
      },
      --{
      --  type = "text",
      --  val = " \/____/\/__/\/_/ \/____/ `/___/> \   \/____/\/___/  \/__,_ /\/____/",
      --  opts = { hl = "NeovimDashboardLogo7", shrink_margin = false, position = "center"},
      --},
      --{
      --  type = "text",
      --  val = " /\___/",
      --  opts = { hl = "NeovimDashboardLogo8", shrink_margin = false, position = "center"},
      --},
      --{
      --  type = "text",
      --  val = " \/__/",
      --  opts = { hl = "NeovimDashboardLogo9", shrink_margin = false, position = "center"},
      --}
      {
        type = "padding",
        val = 1,
      },
      --{
      --type = "text",
      --val = "𝙾𝚑 𝚝𝚑𝚎 𝚓𝚘𝚢 𝚘𝚏 𝚑𝚊𝚟𝚒𝚗𝚐 𝚢𝚘𝚞𝚛 𝚘𝚠𝚗 𝚌𝚞𝚜𝚝𝚘𝚖 𝚝𝚎𝚡𝚝 𝚎𝚍𝚒𝚝𝚘𝚛 :)",
      --opts = { hl = "NeovimDashboardUsername", shrink_margin = false, position = "center" },
      --},
    }
    -- stylua: ignore
    dashboard.section.buttons.val = {
      --dashboard.button("p", " " .. " Open projects",    "<cmd> Telescope projects <cr>"),
      dashboard.button("n", " " .. " New file",        "<cmd> ene | startinsert <cr>"),
      dashboard.button("f", " " .. " Search File",       "<cmd> lua LazyVim.pick()() <cr>"),
      dashboard.button("r", " " .. " Recent files",    "<cmd> lua LazyVim.pick('oldfiles')() <cr>"),
      dashboard.button("g", " " .. " Find text",       "<cmd> lua LazyVim.pick('live_grep')() <cr>"),
      --dashboard.button("Z", " " .. " Open Directories", "<cmd> search_dirs<cr>"),
      dashboard.button("t", "T " .. " Terminal",    "<cmd> term <cr>"),
      dashboard.button("w", " " .. " Notification histories",    "<cmd> Telescope notify <cr>"),
      dashboard.button("c", " " .. " Configure",          "<cmd> lua LazyVim.pick.config_files()() <cr>"),
      dashboard.button("s", " " .. " Recovery Session", [[<cmd> lua require("persistence").load() <cr>]]),
      dashboard.button("x", " " .. " Lazy Extras component",     "<cmd> LazyExtras <cr>"),
      dashboard.button("l", "󰒲 " .. " Lazy Package Manager",            "<cmd> Lazy <cr>"),
      dashboard.button("q", " " .. " Quit( Exit )",            "<cmd> qa <cr>"),
    }
    vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#311B92" }) -- Dark Indigo
    vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#D1C4E9" }) -- Light Purple
    vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#8BC34A" }) -- Greenish
    vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#edd691" })

    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"
    dashboard.opts.layout[1].val = 3
    return dashboard
  end,
  config = function(_, dashboard)
    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    require("alpha").setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "⚡ Lazy neovim loaded "
          .. stats.loaded
          .. "/"
          .. stats.count
          .. " plugins in "
          .. ms
          .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
