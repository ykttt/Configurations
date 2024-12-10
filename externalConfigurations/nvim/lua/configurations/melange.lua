-- configurations/melange.lua
--
local time = { dawn = 700, night = 1700, now = tonumber(vim.fn.strftime("%H%M")) } -- TODO: Automatically change the theme

if time.dawn <= time.now and time.now < time.night then
  vim.o.bg = "light"
else
  vim.o.bg = "dark"
end

vim.cmd.colorscheme("melange")
