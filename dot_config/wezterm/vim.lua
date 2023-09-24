local wezterm = require("wezterm")

local module = {}

function module.is_vim(pane)
  -- this is set by the plugin, and unset on ExitPre in Neovim
  return pane:get_user_vars().IS_NVIM == "true"
end

function module.vim_passthrough(mapping)
  local original_action = mapping.action

  mapping.action = wezterm.action_callback(function(win, pane)
    if module.is_vim(pane) then
      -- pass the keys through to vim/nvim
      win:perform_action({
        SendKey = mapping,
      }, pane)
    else
      win:perform_action(original_action, pane)
    end
  end)

  return mapping
end

return module
