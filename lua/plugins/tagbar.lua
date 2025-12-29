return {
	"preservim/tagbar",
	cmd = { "TagbarToggle", "TagbarOpen", "TagbarClose" },
	keys = {
		{ "<leader>ot", "<cmd>TagbarToggle<cr>", desc = "Toggle Tagbar" },
		{ "n", "<leader>ot", "<cmd>TagbarToggle<CR>", desc = "Toggle Tagbar" },
		{ "n", "<leader>on", "<cmd>TagbarJumpNext<CR>", desc = "Tagbar Next" },
		{ "n", "<leader>op", "<cmd>TagbarJumpPrev<CR>", desc = "Tagbar Prev" },
		{ "n", "<leader>ox", "<cmd>TagbarClose<CR>", desc = "Close Tagbar" },
	},
}
