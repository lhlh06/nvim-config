-- Detail commands in `https://neovim.io/doc/user/fold.html#_2.-fold-commands`
vim.o.foldenable = true
vim.o.foldlevelstart = 99
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldcolumn = '0'
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
