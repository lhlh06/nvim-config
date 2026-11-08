return {
	"danymat/neogen",
	opts = {},
	keys = {
		{
			"<leader>nf",
			function()
				require("neogen").generate()
			end,
			desc = "Generate documentation",
		},
	},
}
