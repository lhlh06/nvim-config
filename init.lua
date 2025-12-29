pcall(function()
	vim.loader.enable()
end)

require("core")
require("lazy_setup")
require("custom")

-- themes
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
