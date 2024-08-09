return {
    {"nvim-treesitter/nvim-treesitter-textobjects"},
    {"nvim-treesitter/nvim-treesitter-context"},
    { "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local treesitter = require("nvim-treesitter.configs")
            treesitter.setup({
                ensure_installed = { "lua", "java", "c", "python", "rust", "haskell", "go", "zig" },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true
                    }
                }
            })
        end,
    }
}
