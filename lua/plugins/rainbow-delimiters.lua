return {
	"HiPhish/rainbow-delimiters.nvim",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	main = "rainbow-delimiters.setup",
	opts = {
		condition = function(bufnr)
			-- Keep special buffers and large files out of rainbow highlighting.
			return vim.bo[bufnr].buftype == ""
				and vim.bo[bufnr].filetype ~= "bigfile"
				and vim.api.nvim_buf_line_count(bufnr) <= 5000
		end,
	},
}
