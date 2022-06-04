local colorscheme = "tokyonight"
-- local colorscheme = "moonfly"
--
-- local colorscheme = "material"
-- vim.g.material_style = "deep ocean"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- https://www.youtube.com/watch?v=jH5PNvJIa6o
-- thin line between split windows
vim.cmd [[highlight WinSeparator guibg=None]]
