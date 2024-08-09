return {
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
        config = function(_, opts) require'lsp_signature'.setup(opts) end
    },
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
                ensure_installed = { "lua_ls", "clangd", "jdtls", "rust_analyzer", "zls", "pyright", "gopls", "tsserver" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()

            local lspconfig = require("lspconfig")
            -- local configs = require("lspconfig.configs")

            local default = require("cmp_nvim_lsp").default_capabilities()
            local on_attach_setup = function(client, bufnr)
                require "lsp_signature".on_attach({
                    bind = true, -- This is mandatory, otherwise border config won't get registered.
                    handler_opts = {
                        border = "rounded"
                    },
                    hint_prefix = ""
                }, bufnr)
            end

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

            vim.keymap.set('n', '<leader>dl', vim.diagnostic.open_float, {})
            vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, {})
            vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_prev, {})
            vim.keymap.set('n', '<space>da', vim.diagnostic.setloclist, {})

            lspconfig.clangd.setup({ capabilities = default, on_attach = on_attach_setup })
            lspconfig.rust_analyzer.setup({ capabilities = default, on_attach = on_attach_setup })
            lspconfig.zls.setup({ capabilities = default, on_attach = on_attach_setup })
            lspconfig.pyright.setup({ capabilities = default, on_attach = on_attach_setup })
            lspconfig.gopls.setup({ capabilities = default, on_attach = on_attach_setup })
            lspconfig.tsserver.setup({ capabilities = default, on_attach = on_attach_setup })

            -- lspconfig.hls.setup({ capabilities = default, on_attach = on_attach_setup })

            -- if not configs.prolog_lsp then
            --     configs.prolog_lsp = {
            --         default_config = {
            --             cmd = { 'swipl', '-g', 'use_module(library(lsp_server)).', '-g', 'lsp_server:main', '-t', 'halt', '--', 'stdio'},
            --             filetypes = {'prolog'},
            --             root_dir = lspconfig.util.root_pattern('.git')
            --         }
            --     }
            -- end
            -- lspconfig.prolog_lsp.setup({ capabilities = default, on_attach = on_attach_setup })

            lspconfig.jdtls.setup({
                capabilities = default,
                on_attach = on_attach_setup,
                settings = {
                    java = {signatureHelp = {enabled = true}, contentProvider = {preferred = 'fernflower'}}
                },
                on_init = function(client)
                    if client.config.settings then
                        client.notify('workspace/didChangeConfiguration', {settings = client.config.settings})
                    end
                end
            })

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
