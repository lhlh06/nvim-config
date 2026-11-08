return {
	"folke/todo-comments.nvim",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TodoTelescope", "TodoTrouble", "TodoQuickFix", "TodoLocList" },
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	keys = {
		{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find todos" },
		{
			"]t",
			function()
				require("todo-comments").jump_next()
			end,
			desc = "Next todo comment",
		},
		{
			"[t",
			function()
				require("todo-comments").jump_prev()
			end,
			desc = "Previous todo comment",
		},
	},
}
