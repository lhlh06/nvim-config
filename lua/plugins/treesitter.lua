return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	dependencies = {
		{
			"windwp/nvim-ts-autotag",
			opts = {},
		},
	},
	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true }),
			callback = function()
				-- Enable treesitter highlighting and disable regex syntax
				pcall(vim.treesitter.start)
				-- Enable treesitter-based indentation
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
		local ensureInstalled = {
			"json",
			"javascript",
			"typescript",
			"tsx",
			"yaml",
			"html",
			"css",
			"markdown",
			"markdown_inline",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
			"query",
			"vimdoc",
			"c",
			"cpp",
			"cuda",
			"rust",
			"toml",
			"java",
			"sql",
			"cmake",
			"csv",
			"doxygen",
			"ini",
			"make",
			"python",
			"tmux",
			"asm",
			"haskell",
			"svelte",
		}
		local alreadyInstalled = require("nvim-treesitter").get_installed()
		local parsersToInstall = vim.iter(ensureInstalled)
			:filter(function(parser)
				return not vim.tbl_contains(alreadyInstalled, parser)
			end)
			:totable()
		if #parsersToInstall > 0 then
			require("nvim-treesitter").install(parsersToInstall)
		end
	end,
}
