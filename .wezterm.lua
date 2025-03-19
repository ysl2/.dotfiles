local wezterm = require('wezterm')

local config = wezterm.config_builder()

if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
  config.default_prog = { 'pwsh', '-NoLogo', '-WorkingDirectory', '~' }
end

return config
