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
  vim.g.transparency = 0.9
  vim.g.neovide_background_color = "#0f1117" .. alpha()

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
end

vim.o.guifont = "JetBrainsMono_NF:h11:#e-subpixelantialias"
