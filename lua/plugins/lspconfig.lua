return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim",                   opts = {} },
    },
    config = function()
        -- import lspconfig plugin
        local lspconfig = require("lspconfig")

        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap -- for conciseness

        vim.diagnostic.config({ virtual_text = true })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf, silent = true }

                -- Inlay Hints
                local client = vim.lsp.get_client_by_id(ev.data.client_id)
                if client.server_capabilities.inlayHintProvider then
                    vim.lsp.inlay_hint.enable(true)
                end

                -- set keybinds
                opts.desc = "Show LSP references"
                keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

                opts.desc = "Go to declaration"
                keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

                opts.desc = "Show LSP definitions"
                keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

                opts.desc = "Show LSP implementations"
                keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

                opts.desc = "Show LSP type definitions"
                keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

                opts.desc = "See available code actions"
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

                opts.desc = "Smart rename"
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

                opts.desc = "Show buffer diagnostics"
                keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

                opts.desc = "Show line diagnostics"
                keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

                opts.desc = "Go to previous diagnostic"
                keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

                opts.desc = "Go to next diagnostic"
                keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

                opts.desc = "Show documentation for what is under cursor"
                keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
            end,
        })

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- local hl = "DiagnosticSign" .. type
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ",
                    [vim.diagnostic.severity.WARN] = " ",
                    [vim.diagnostic.severity.HINT] = "󰠠 ",
                    [vim.diagnostic.severity.INFO] = " ",
                },
                -- linehl = hl,
                numhl = {},
            }
        })
        -- end


        -- Rust
        lspconfig.rust_analyzer.setup {
            capabilities = capabilities,
            settings = {
                ["rust-analyzer"] = {
                    cargo = {
                        allFeatures = true,
                    },
                    checkOnSave = {
                        allFeatures = true,
                        command = "clippy",
                        extraArgs = {
                            "--",
                            "--no-deps",
                            "-Wclippy::all",
                            "-Dclippy::correctness",
                            "-Dclippy::complexity",
                            "-Wclippy::perf",
                            "-Wclippy::pedantic",
                        },
                    },
                    procMacro = {
                        enable = true,
                    },
                    diagonostics = {
                        enable = true,
                    },
                    imports = {
                        group = { enable = true },
                    },
                }
            }
        }


        local lsp_signature = require("lsp_signature")
        -- C, CPP, CXX Clangd
        lspconfig.clangd.setup {
            capabilities = capabilities,
            cmd = { "clangd", "--background-index", "--clang-tidy", "--completion-style=detailed" },
            on_attch = function(client, bufnr)
                lsp_signature.on_attch({
                    bind = true,
                    floating_window = true,
                    hint_enable = true,
                }, bufnr)
            end,
            settings = {
                inlay_hints = {
                    enabled = true,
                }
            }
        }

        -- lua
        lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
                Lua = {
                    hint = {
                        enable = true,
                        setType = true,
                    },
                },
            }

        }

        -- toml
        lspconfig.taplo.setup {
            capabilities = capabilities,
        }

        -- Bash
        lspconfig.bashls.setup {
            capabilities = capabilities,
        }

        -- lspconfig.hls.setup {
        --     capabilities = capabilities,
        --     settings = {
        --         filetypes = { "haskell", "lhaskell", "cabal" },
        --     }
        -- }
    end
}
