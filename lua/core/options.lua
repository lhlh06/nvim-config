local opt = vim.opt

-- line number
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursorline
opt.cursorline = true
opt.mouse = "a"

-- apperance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- back space
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

opt.colorcolumn = "80,100"

-- split windows
opt.splitright = true
opt.splitbelow = true

-- opt.iskeyword:append("-")
opt.swapfile = false
