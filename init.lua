-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local alpha = function()
  return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
end

if vim.g.neovide then
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  --vim.g.neovide_transparency = 0.8
  vim.g.neovide_transparency = 0.85
  -- vim.g.neovide_background_color = "#0f1117" .. alpha()

  vim.g.neovide_scroll_animation_length = 0.3
  vim.g.neovide_position_animation_length = 0.15

  vim.g.neovide_cursor_animate_command_line = true
  vim.g.neovide_cursor_trail_size = 0.6
  vim.g.neovide_cursor_animation_length = 0.12
  vim.g.neovide_refresh_rate_idle = 25
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_theme = "auto"
  vim.g.neovide_hide_mouse_when_typing = false
  vim.g.neovide_line_space = 10
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_underline_automatic_scaling = false
end
--Add powershell emulator
vim.opt.shell = vim.fn.executable "pwsh" and "pwsh" or 'powershell'
-- vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
-- vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
-- vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
-- vim.opt.shellquote = ""
-- vim.opt.shellxquote = ""
--Add font
vim.o.guifont = "JetBrainsMono_NF:h11:#e-subpixelantialias"
--vim.o.guifont = "Hasklug Nerd Font:h12:#e-subpixelantialias"
--vim.o.guifont = "CaskaydiaCove Nerd Font:h12" --:#e-subpixelantialias"
vim.opt.termguicolors = true
