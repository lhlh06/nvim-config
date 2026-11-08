return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files in cwd" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Fuzzy find recent files" },
		{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find string in cwd" },
		{ "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor in cwd" },
		{ "<leader>gr", "<cmd>Telescope lsp_references<cr>", desc = "Find references using telescope" },
		{ "<leader>gi", "<cmd>Telescope lsp_implementations<cr>", desc = "Find implementations using telescope" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers in telescope" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod

		local custom_actions = transform_mod({
			open_trouble_qflist = function()
				require("trouble").toggle("quickfix")
			end,
		})

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
						["<C-x>"] = function(prompt_bufnr)
							require("trouble.sources.telescope").open(prompt_bufnr)
						end,
					},
				},
				file_ignore_patterns = {
					"Cargo.lock",
					"target",
				},
			},
		})

		telescope.load_extension("fzf")
	end,
}
