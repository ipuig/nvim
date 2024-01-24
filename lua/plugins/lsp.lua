return {
    {
        "williamboman/mason.nvim",
        config = function()
            local mason = require("mason")
            mason.setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup({
                ensure_installed = { "lua_ls", "clangd", "jdtls", "rust_analyzer", "zls", "pyright" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()

            local lspconfig = require("lspconfig")
            local default = require("cmp_nvim_lsp").default_capabilities()

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set('n', '<space>ld', vim.diagnostic.open_float, {})

            lspconfig.clangd.setup({ capabilities = default })
            lspconfig.jdtls.setup({ capabilities = default })
            lspconfig.rust_analyzer.setup({ capabilities = default })
            lspconfig.zls.setup({ capabilities = default })
            lspconfig.hls.setup({ capabilities = default })
            lspconfig.pyright.setup({ capabilities = default })

            lspconfig.lua_ls.setup({
                capabilities = default,
                settings = { -- custom settings for lua
                    Lua = {
                        -- make the language server recognize "vim" global
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            -- make language server aware of runtime files
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.stdpath("config") .. "/lua"] = true,
                            },
                        },
                    },
                },
            })
        end,
    },
}
