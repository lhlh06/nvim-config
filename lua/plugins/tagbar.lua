return {
	"preservim/tagbar",
	cmd = { "TagbarToggle", "TagbarOpen", "TagbarClose" },
	keys = {
		{ "<leader>ot", "<cmd>TagbarToggle<cr>", desc = "Toggle Tagbar" },
		{ "<leader>ot", "<cmd>TagbarToggle<CR>", desc = "Toggle Tagbar" },
		{ "<leader>on", "<cmd>TagbarJumpNext<CR>", desc = "Tagbar Next" },
		{ "<leader>op", "<cmd>TagbarJumpPrev<CR>", desc = "Tagbar Prev" },
		{ "<leader>ox", "<cmd>TagbarClose<CR>", desc = "Close Tagbar" },
	},
}
