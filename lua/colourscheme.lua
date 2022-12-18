--[[ colourscheme.lua ]]
--Sets colourscheme to the selected one below. If not install then use default
--rather than throw an error

local colorscheme = 'dracula'

local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)

if not status_ok then
  vim.notify('Colourscheme ' .. colorscheme .. ' not found!')
  return
end
