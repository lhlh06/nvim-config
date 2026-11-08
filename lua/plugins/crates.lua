return {
	"saecki/crates.nvim",
	tag = "stable",
	event = { "BufReadPre Cargo.toml", "BufNewFile Cargo.toml" },
	config = function()
		require("crates").setup({
			lsp = {
				enabled = true,
				actions = true,
				completion = true,
				hover = true,
			},
		})
	end,
}
