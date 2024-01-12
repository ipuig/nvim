return {
    {
        "williamboman/mason.nvim",
        config = function()
            local mason = require("mason")
            mason.setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup({
                ensure_installed = { "lua_ls" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local default = require("cmp_nvim_lsp").default_capabilities()

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

            lspconfig.lua_ls.setup({ capabilities = default})
            lspconfig.clangd.setup({ capabilities = default})
        end
    }
}
