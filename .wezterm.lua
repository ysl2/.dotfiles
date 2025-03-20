local wezterm = require("wezterm")
local config = wezterm.config_builder()
local home = not wezterm.target_triple:find("windows") and os.getenv("HOME") or os.getenv("USERPROFILE")


--- =======================
--- === Global settings ===
--- =======================
config.default_prog = { wezterm.target_triple:find("darwin") and "/opt/homebrew/bin/nu" or "nu" }
config.audible_bell = "Disabled"
config.automatically_reload_config = true
config.color_scheme = "Catppuccin Mocha"
config.disable_default_key_bindings = true
config.enable_tab_bar = false
config.font = wezterm.font("FiraCode Nerd Font")
config.keys = config.keys or wezterm.gui.default_keys()
config.key_tables = config.key_tables or wezterm.gui.default_key_tables()
-- NOTE: Must run this below to add terminfo
-- ```bash
-- tempfile=$(mktemp) && curl -o $tempfile https://ghfast.top/https://raw.githubusercontent.com/wezterm/wezterm/main/termwiz/data/wezterm.terminfo && tic -x -o ~/.terminfo $tempfile && rm $tempfile
-- ```
config.term = not wezterm.target_triple:find("windows") and "wezterm" or "xterm-256color"
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"


-- =======================
-- === Keymap settings ===
-- =======================
table.insert(config.keys,
  {
    key = "Enter",
    mods = "NONE",
    action = wezterm.action.Multiple({
      wezterm.action.ClearSelection,
      wezterm.action.ScrollToBottom,
      wezterm.action.SendKey({ key = "Enter" }),
    })
  }
)
local copy_mode = config.key_tables.copy_mode
for i, item in ipairs(copy_mode) do
  if item.key == "mapped:y" and item.mods == "NONE" then
    copy_mode[i] = {
      key = item.key,
      mods = item.mods,
      action = wezterm.action.Multiple({
        wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
        wezterm.action.CopyMode("Close"),
        wezterm.action.ClearSelection,
        wezterm.action.ScrollToBottom,
      })
    }
    break
  end
end
local tmp = {
  {
    key = "Enter",
    mods = "NONE",
    action = wezterm.action.Multiple({
      wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
      wezterm.action.CopyMode("Close"),
      wezterm.action.ClearSelection,
      wezterm.action.ScrollToBottom,
      wezterm.action.SendKey({ key = "Enter" }),  -- TODO: This not work, don't know why.
    })
  },
  {
    key = "Escape",
    mods = "NONE",
    action = wezterm.action.Multiple({
      wezterm.action.CopyMode("Close"),
      wezterm.action.ClearSelection,
      wezterm.action.ScrollToBottom,
    })
  },
}
for _, v in ipairs(tmp) do
    copy_mode[#copy_mode + 1] = v
end


-- ==================================
-- === Platform specific settings ===
-- ==================================
-- if wezterm.target_triple:find("windows") ~= nil then
--   config.default_prog = { "pwsh", "-NoLogo", "-WorkingDirectory", "~" }
-- -- elseif wezterm.target_triple:find("darwin") ~= nil then
--   -- local function map(t, fn)
--   --   local result = {}
--   --   for i, v in ipairs(t) do
--   --     result[i] = fn(v)
--   --   end
--   --   return result
--   -- end
--   -- local function remap_keys(bindings)
--   --   if not bindings then return {} end
--   --   return map(bindings, function(binding)
--   --     local new_binding = { key = binding.key, action = binding.action }
--   --     if binding.mods and type(binding.mods) == "string" then
--   --       new_binding.mods = binding.mods:gsub("CTRL", "SUPER")
--   --     else
--   --       new_binding.mods = binding.mods
--   --     end
--   --     return new_binding
--   --   end)
--   -- end
--   -- -- config.keys = remap_keys(config.keys)
--   -- -- for mode, bindings in pairs(config.key_tables) do
--   -- --   config.key_tables[mode] = remap_keys(bindings)
--   -- -- end
--   -- config.key_tables["copy_mode"] = remap_keys(config.key_tables["copy_mode"])
-- end


-- ===============================================
-- === Load ~/.wezterm.localhost.lua if exists ===
-- ===============================================
local ok, localhost = pcall(dofile, home .. "/.wezterm.localhost.lua")
if ok and type(localhost) == "table" then
  for key, value in pairs(localhost) do
    config[key] = value
  end
end


return config
