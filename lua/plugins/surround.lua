return {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            keymaps = {
                normal = "s",
                visual = "s",
                delete = "ds",
                change = "cs",
                change_line = "cS",
            },
        })
    end
}
