vim.g.mapleader = " "

local keymap = vim.keymap

local map = vim.keymap.set
local expr_options = { expr = true, silent = true }
--Remap for dealing with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_options)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_options)

keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "gr", vim.lsp.buf.references)

keymap.set("n", "<leader>fm", ":Format<CR>")
