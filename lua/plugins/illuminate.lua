return {
    "RRethy/vim-illuminate",
    config = function()
        vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#575757" })
        vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#575757" })
        vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#575757" })
    end
}
