return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["C-k"] = actions.move_selection_previous,
						["C-j"] = actions.move_selection_next,
						["C-q"] = actions.send_selected_to_qflist,
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})

		vim.keymap.set("n", "<C-p>", builtin.find_files, {})
		telescope.load_extension("ui-select")
	end,
}
