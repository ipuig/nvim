return {
    {"nvim-treesitter/nvim-treesitter-context"},
    { "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local treesitter = require("nvim-treesitter.configs")
            treesitter.setup({
                ensure_installed = { "lua", "java", "c", "python", "rust" },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    }}
