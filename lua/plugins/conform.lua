return {
	"stevearc/conform.nvim",
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format({
					lsp_format = "fallback",
					async = false,
					timeout_ms = 1000,
				})
			end,
			mode = { "n", "v" },
			desc = "Format file or range (in visual mode)",
		},
	},
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				-- javascript = { "prettier" },
				-- typescript = { "prettier" },
				-- javascriptreact = { "prettier" },
				-- typescriptreact = { "prettier" },
				-- svelte = { "prettier" },
				-- css = { "prettier" },
				-- html = { "prettier" },
				-- json = { "prettier" },
				-- yaml = { "prettier" },
				-- markdown = { "prettier" },
				-- graphql = { "prettier" },
				-- liquid = { "prettier" },
				lua = { "stylua" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				rust = { "rustfmt" },
				toml = { "taplo" },
				-- python = { "isort", "black" },
			},
			-- format_on_save = {
			--     lsp_fallback = true,
			--     async = false,
			--     timeout_ms = 1000,
			-- },
		})
	end,
}
