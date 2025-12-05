return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		local function window()
			return vim.api.nvim_win_get_number(0)
		end

		-- configure lualine with modified theme
		local config = {
			options = {
				theme = "gruvbox-material",
				globalstatus = false,
				disabled_filetypes = {
					statusline = { "NvimTree", "tagbar" },
					winbar = { "NvimTree" },
				},
			},
			sections = {
				lualine_a = { "mode", window },
				lualine_c = {
					{ "filename", file_status = true, path = 1, shorting_target = 100 },
				},
				lualine_x = {
					{
						"lsp_status",
					},
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
			inactive_sections = {
				lualine_a = { window },
				lualine_b = { "diff", "diagnostics" },
				lualine_c = { { "filename", file_status = true, path = 1, shorting_target = 100 } },
				lualine_x = { "encoding", "filetype" },
				lualine_y = {},
				lualine_z = { "location" },
			},
		}

		lualine.setup(config)
	end,
}
