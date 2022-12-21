require("zen-mode").setup({
	window = {
		backdrop = 1.0,
		width = 128,
		options = {
			number = true,
			relativenumber = true,
		},
	},
	plugins = {
		kitty = {
			enabled = true,
			font = "+0", -- font size increment
		},
		tmux = {
			enabled = true,
		},
	},
})
