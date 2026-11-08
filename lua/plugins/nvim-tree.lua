return {
	"nvim-tree/nvim-tree.lua",
	cmd = {
		"NvimTreeOpen",
		"NvimTreeClose",
		"NvimTreeToggle",
		"NvimTreeFindFile",
		"NvimTreeFindFileToggle",
		"NvimTreeCollapse",
		"NvimTreeRefresh",
	},
	keys = {
		{ "<leader>ee", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
		{ "<leader>ef", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Toggle file explorer on current file" },
		{ "<leader>ec", "<cmd>NvimTreeCollapse<cr>", desc = "Collapse file explorer" },
		{ "<leader>er", "<cmd>NvimTreeRefresh<cr>", desc = "Refresh file explorer" },
	},
	dependencies = "nvim-tree/nvim-web-devicons",
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		-- Preserve directory browsing for both `nvim .` and `:edit directory`.
		vim.api.nvim_create_autocmd("BufEnter", {
			group = vim.api.nvim_create_augroup("UserNvimTreeDirectories", { clear = true }),
			callback = function(ev)
				if vim.fn.isdirectory(ev.file) == 1 then
					vim.cmd("NvimTreeOpen " .. vim.fn.fnameescape(ev.file))
				end
			end,
		})
	end,
	config = function()
		local nvimtree = require("nvim-tree")

		nvimtree.setup({
			view = {
				width = 30,
				relativenumber = true,
			},
			-- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			-- disable window_picker for
			-- explorer to work well with
			-- window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store", "^.cache", "node_modules", "*.d$", "*.o$" },
			},
			git = {
				ignore = false,
			},
		})

		-- Register file-operation events before the first tree buffer is opened.
		require("lsp-file-operations").setup()
	end,
}
