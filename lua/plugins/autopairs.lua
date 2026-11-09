return {
	"nvim-mini/mini.pairs",
	event = "InsertEnter",
	version = "*",
	config = function()
		require("mini.pairs").setup()
		-- A picker-local <CR> can prevent mini.pairs from creating its global mapping.
		-- Set it explicitly so Blink can fall back to pair expansion in code buffers.
		vim.keymap.set("i", "<CR>", "v:lua.MiniPairs.cr()", {
			expr = true,
			replace_keycodes = false,
			desc = "MiniPairs <CR>",
		})
	end,
}
