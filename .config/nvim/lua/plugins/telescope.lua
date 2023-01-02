return {
	"nvim-telescope/telescope.nvim",
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			-- configure custom mappings
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
					},
				},
				file_ignore_patterns = { "node_modules" },
			},

			pickers = {
				find_files = {
					hidden = true,
				},
			},
		})

		telescope.load_extension("fzy_native")
		telescope.load_extension("git_worktree")
	end,
}
