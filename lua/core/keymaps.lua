vim.g.mapleader = " "

local keymap = vim.keymap

local map = vim.keymap.set
local expr_options = { expr = true, silent = true }
--Remap for dealing with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_options)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_options)

keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("n", "gr", vim.lsp.buf.references)

keymap.set("n", "<leader>fm", ":Format<CR>", { desc = "Format the code" })


-- Tabs
keymap.set("n", "<leader>tc", ":tabnew<CR>", { desc = "create a new tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "close the tab" })
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "next tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "previous tab" })


-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Tagbar
keymap.set("n", "<leader>ot", "<cmd>TagbarToggle", { desc = "Toggle Tagbar" })
keymap.set("n", "<leader>on", "<cmd>TagbarJumpNext<CR>", { desc = "Tagbar Next" })
keymap.set("n", "<leader>op", "<cmd>TagbarJumpPrev<CR>", { desc = "Tagbar Prev" })
keymap.set("n", "<leader>ox", "<cmd>TagbarClose<CR>", { desc = "Close Tagbar" })

-- buffers
keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Close Tagbar" })
keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Close Tagbar" })
keymap.set("n", "<leader>bx", "<cmd>bdelete<CR>", { desc = "Close Tagbar" })
