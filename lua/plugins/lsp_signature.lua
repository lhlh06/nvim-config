return {
	"ray-x/lsp_signature.nvim",
	lazy = true,
	opts = {
		bind = true,
		floating_window = true,
		hint_enable = true,
	},
	config = function(_, opts)
		require("lsp_signature").setup(opts)
	end,
}
