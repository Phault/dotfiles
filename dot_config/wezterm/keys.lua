local wezterm = require("wezterm")
local act = wezterm.action
local vim = require("vim")
local vim_passthrough = vim.vim_passthrough

return {
  { key = "\\", mods = "CTRL",       action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "|",  mods = "SHIFT|CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "[",  mods = "CTRL",       action = act.ActivateTabRelative(-1) },
  { key = "]",  mods = "CTRL",       action = act.ActivateTabRelative(1) },
  { key = "[",  mods = "SHIFT|CTRL", action = act.MoveTabRelative(-1) },
  { key = "]",  mods = "SHIFT|CTRL", action = act.MoveTabRelative(1) },
  { key = "1",  mods = "CTRL",       action = act.ActivateTab(0) },
  { key = "1",  mods = "SUPER",      action = act.ActivateTab(0) },
  { key = "2",  mods = "CTRL",       action = act.ActivateTab(1) },
  { key = "2",  mods = "SUPER",      action = act.ActivateTab(1) },
  { key = "3",  mods = "CTRL",       action = act.ActivateTab(2) },
  { key = "3",  mods = "SUPER",      action = act.ActivateTab(2) },
  { key = "4",  mods = "CTRL",       action = act.ActivateTab(3) },
  { key = "4",  mods = "SUPER",      action = act.ActivateTab(3) },
  { key = "5",  mods = "CTRL",       action = act.ActivateTab(4) },
  { key = "5",  mods = "SUPER",      action = act.ActivateTab(4) },
  { key = "6",  mods = "CTRL",       action = act.ActivateTab(5) },
  { key = "6",  mods = "SUPER",      action = act.ActivateTab(5) },
  { key = "7",  mods = "CTRL",       action = act.ActivateTab(6) },
  { key = "7",  mods = "SUPER",      action = act.ActivateTab(6) },
  { key = "8",  mods = "CTRL",       action = act.ActivateTab(7) },
  { key = "8",  mods = "SUPER",      action = act.ActivateTab(7) },
  vim_passthrough({ key = "h", mods = "CTRL", action = act.ActivatePaneDirection("Left") }),
  vim_passthrough({ key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") }),
  vim_passthrough({ key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") }),
  vim_passthrough({ key = "l", mods = "CTRL", action = act.ActivatePaneDirection("Right") }),
  vim_passthrough({ key = "LeftArrow", mods = "CTRL", action = act.AdjustPaneSize({ "Left", 3 }) }),
  vim_passthrough({ key = "DownArrow", mods = "CTRL", action = act.AdjustPaneSize({ "Down", 3 }) }),
  vim_passthrough({ key = "UpArrow", mods = "CTRL", action = act.AdjustPaneSize({ "Up", 3 }) }),
  vim_passthrough({ key = "RightArrow", mods = "CTRL", action = act.AdjustPaneSize({ "Right", 3 }) }),
  vim_passthrough({ key = "u", mods = "CTRL", action = act.ScrollByPage(-1) }),
  vim_passthrough({ key = "d", mods = "CTRL", action = act.ScrollByPage(1) }),
}
