return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["C-k"] = actions.move_selection_previous,
                        ["C-j"] = actions.move_selection_next,
                        ["C-q"] = actions.send_selected_to_qflist,
                    }
                }
            }
        })

        -- Keymaps
        print("loading telescope specific keymaps")
        vim.keymap.set("n", "C-p", "<cmd>Telescope find_files<CR>")
    end
}
