pcall(function()
	vim.loader.enable()
end)

require("core")
require("lazy_setup")
require("custom")

-- themes
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
-- underline rust mutable vars and methods
vim.api.nvim_set_hl(0, "@lsp.mod.mutable.rust", { underline = true })
