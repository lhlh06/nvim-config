require("core")
require("lazy_setup")
require("custom")

-- set default `commentstring` for `c` and `cpp`
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp" },
    callback = function()
        vim.bo.commentstring = "// %s"
    end,
})

-- themes
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#575757" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#575757" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#575757" })
