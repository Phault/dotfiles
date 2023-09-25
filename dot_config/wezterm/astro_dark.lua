local c = {
  syntax = {},
  ui = {},
  term = {},
}

c.syntax.red = "#FF838B"
c.syntax.orange = "#F5983A"
c.syntax.yellow = "#DFAB25"
c.syntax.green = "#87C05F"
c.syntax.cyan = "#4AC2B8"
c.syntax.blue = "#5EB7FF"
c.syntax.purple = "#DD97F1"
c.syntax.text = "#ADB0BB"
c.syntax.comment = "#696C76"
c.syntax.mute = "#595C66"

c.ui.red = "#F8747E"
c.ui.orange = "#EB8332"
c.ui.yellow = "#D09214"
c.ui.green = "#75AD47"
c.ui.cyan = "#00B298"
c.ui.blue = "#50A4E9"
c.ui.purple = "#CC83E3"
c.ui.accent = "#50A4E9"
c.ui.tabline = "#111317"
c.ui.winbar = "#797D87"
c.ui.tool = "#16181D"
c.ui.base = "#1A1D23"
c.ui.inactive_base = "#16181D"
c.ui.statusline = "#111317"
c.ui.split = "#111317"
c.ui.popup = "#16181D"
c.ui.float = "#16181D"
c.ui.title = c.ui.accent
c.ui.border = "#3A3E47"
c.ui.current_line = "#1E222A"
c.ui.scrollbar = c.ui.accent
c.ui.selection = "#26343F"
c.ui.menu_selection = c.ui.accent
c.ui.highlight = "#1E222A"
c.ui.none_text = "#3A3E47"
c.ui.text = "#9B9FA9"
c.ui.text_active = "#ADB0BB"
c.ui.text_inactive = "#494D56"
c.ui.text_match = c.ui.accent

c.term.black = c.ui.tabline
c.term.bright_black = c.ui.text_inactive -- originally c.ui.tabline, but powershell options became near-invisible
c.term.red = c.syntax.red
c.term.bright_red = c.syntax.red
c.term.green = c.syntax.green
c.term.bright_green = c.syntax.green
c.term.yellow = c.syntax.yellow
c.term.bright_yellow = c.syntax.yellow
c.term.blue = c.syntax.blue
c.term.bright_blue = c.syntax.blue
c.term.purple = c.syntax.purple
c.term.bright_purple = c.syntax.purple
c.term.cyan = c.syntax.cyan
c.term.bright_cyan = c.syntax.cyan
c.term.white = c.ui.text
c.term.bright_white = c.ui.text_active
c.term.background = c.ui.base
c.term.foreground = c.ui.text

local astro_dark = {
  foreground = c.term.foreground,
  background = c.term.background,

  cursor_bg = c.syntax.text,
  cursor_fg = c.ui.base,
  cursor_border = c.syntax.text,
  compose_cursor = c.syntax.text,

  selection_fg = "none",
  selection_bg = c.ui.selection,

  -- scrollbar_thumb = '#222222',

  split = c.ui.split,

  ansi = {
    c.term.black,
    c.term.red,
    c.term.green,
    c.term.yellow,
    c.term.blue,
    c.term.purple,
    c.term.cyan,
    c.term.white,
  },
  brights = {
    c.term.bright_black,
    c.term.bright_red,
    c.term.bright_green,
    c.term.bright_yellow,
    c.term.bright_blue,
    c.term.bright_purple,
    c.term.bright_cyan,
    c.term.bright_white,
  },

  -- copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
  -- copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
  -- copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

  -- quick_select_label_bg = { Color = "peru" },
  -- quick_select_label_fg = { Color = "#ffffff" },
  -- quick_select_match_bg = { AnsiColor = "Navy" },
  -- quick_select_match_fg = { Color = "#ffffff" },

  tab_bar = {
    background = c.ui.tabline,

    active_tab = {
      bg_color = c.ui.base,
      fg_color = c.ui.text_active,
      intensity = "Bold",
      italic = true,
    },

    inactive_tab = {
      bg_color = c.ui.tabline,
      fg_color = c.ui.text_inactive,
    },

    inactive_tab_hover = {
      bg_color = c.ui.tabline,
      fg_color = c.ui.text_active,
    },

    new_tab = {
      bg_color = c.ui.tabline,
      fg_color = c.ui.text_inactive,
    },

    new_tab_hover = {
      bg_color = c.ui.tabline,
      fg_color = c.ui.text_active,
    },
  },
}

return astro_dark
