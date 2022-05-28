-- local colorscheme = "tokyonight"
local colorscheme = "moonfly"
-- local colorscheme = "material"
-- vim.g.material_style = "deep ocean"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
