return {
    "akinsho/bufferline.nvim",
    branch = "main",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- version = "*",
    opts = {
        options = {
            mode = "tabs",
            -- numbers = "ordinal",
            indicator = { style = "underline" },
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local s = " "
                for e, n in pairs(diagnostics_dict) do
                    local sym = e == "error" and " "
                        or (e == "warning" and " " or "")
                    if e == "" then
                        s = s
                    else
                        s = s .. sym .. n
                    end
                end
                return s
            end,
            separator_style = "slant",
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "left",
                    separator = true,
                },
            },
        },
    },
}
