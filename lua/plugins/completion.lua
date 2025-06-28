return {
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-buffer" },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            local ls = require("luasnip")
            vim.keymap.set({"i"}, "<C-f>", function() ls.expand() end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-H>", function() ls.jump(-1) end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-E>", function() if ls.choice_active() then ls.change_choice(1) end end, {silent = true})
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                view = {
                    entries = {
                        name = "custom",
                        selection_order = "near_cursor"
                    }
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-k>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-j>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-q>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                    { name = "path" },
                }),
            })
        end,
    },
}
