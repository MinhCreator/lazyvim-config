local bufferline = require("bufferline")
return {
  bufferline.setup({
    options = {
      mode = "buffers", -- set to "tabs" to only show tabpages instead
      -- style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
      --themable = true | false, -- allows highlight groups to be overriden i.e. sets highlights as default
      --numbers = "ordinal",
      indicator = {
        --icon = "none", -- this should be omitted if indicator style is not 'icon'
        style = "underline",
      },
      buffer_close_icon = "󰅖",
      modified_icon = "● ",
      close_icon = " ",
      left_trunc_marker = " ",
      right_trunc_marker = " ",

      --max_name_length = 18,
      --max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      --truncate_names = true, -- whether or not tab names should be truncated
      --tab_size = 18,
      diagnostics = "nvim_lsp",
      diagnostics_update_on_event = true, -- use nvim's diagnostic handler
      -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting

      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and " " or (e == "warning" and " " or " ")
          s = s .. n .. sym
        end
        return s
      end,

      --offsets = {
      --{
      --text_align = "center",
      --separator = true,
      --},
      --},
      color_icons = true, -- whether or not to add the filetype icon highlights

      show_buffer_icons = true, -- disable filetype icons for buffers
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      --duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
      --move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
      },
    },
  }),
}
