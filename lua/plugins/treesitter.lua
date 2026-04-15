return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    init = function()
        vim.api.nvim_create_autocmd('FileType', {
            callback = function()
                -- Enable treesitter highlighting and disable regex syntax
                pcall(vim.treesitter.start)
                -- Enable treesitter-based indentation
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
    config = function()
        -- import nvim-treesitter plugin
        local treesitter = require("nvim-treesitter")
        -- configure treesitter
        treesitter.setup({ -- enable syntax highlighting
            sync_install = false,
            auto_install = true,
            ignore_install = {
                "tex",
                "latex",
            },
            highlight = {
                enable = true,
                disable = {
                    "tex",
                    "latex",
                },
            },
            -- enable indentation
            indent = { enable = true },
            -- enable autotagging (w/ nvim-ts-autotag plugin)
            autotag = {
                enable = true,
            },
            -- ensure these language parsers are installed
            ensure_installed = {
                "json",
                "jsonc",
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
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },

        })

    end,
}
