return {
	{ "nvim-lua/plenary.nvim", lazy = false, priority = 1000 }, -- lua functions that many plugins use

	{
		"rmagatti/auto-session",
		lazy = false,
		priority = 1000,
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/projects", "~/downloads", "/" },
			})
		end,
	},

	-- navigation
	{ "christoomey/vim-tmux-navigator" }, -- tmux & split window navigation
	{
		"akinsho/toggleterm.nvim",
	},
	{
		"cbochs/grapple.nvim", -- immediate navigation to important files
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "ggandor/leap.nvim" }, -- general-purpose motion plugin

	-- fuzzy finding w/ telescope
	{
		"nvim-telescope/telescope.nvim", -- fuzzy finder
		dependencies = { "nvim-lua/plenary.nvim", "kdheepak/lazygit.nvim" },
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	},

	{ "nvim-telescope/telescope-fzy-native.nvim" }, -- dependency for better sorting performance
	{ "nvim-telescope/telescope-file-browser.nvim" },

	-- autocompletion
	{ "hrsh7th/nvim-cmp", dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" } }, -- completion plugin
	{ "hrsh7th/cmp-buffer" }, -- source for text in buffer
	{ "hrsh7th/cmp-path" }, -- source for file system paths

	-- snippets
	{ "L3MON4D3/LuaSnip" }, -- snippet engine
	{ "saadparwaiz1/cmp_luasnip" }, -- for autocompletion
	{ "rafamadriz/friendly-snippets" }, -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	{ "williamboman/mason.nvim" }, -- in charge of managing lsp servers, linters & formatters
	{ "williamboman/mason-lspconfig.nvim" }, -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",
		},
	},
	{ "hrsh7th/cmp-nvim-lsp" }, -- for autocompletion
	{ "glepnir/lspsaga.nvim" }, -- enhanced lsp uis
	{ "jose-elias-alvarez/typescript.nvim" }, -- additional functionality for typescript server (e.g. rename file & update imports)
	{ "onsails/lspkind.nvim" }, -- vs-code like icons for autocompletion
	{ "j-hui/fidget.nvim" },

	-- formatting & linting
	{ "jose-elias-alvarez/null-ls.nvim" }, -- configure formatters & linters
	{ "jayp0521/mason-null-ls.nvim" }, -- bridges gap b/w mason & null-ls
	{ "steelsojka/headwind.nvim" }, -- format tailwind classes

	-- treesitter configuration
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-treesitter/nvim-treesitter-textobjects", dependencies = { "nvim-treesitter/nvim-treesitter" } },

	-- auto closing
	{ "windwp/nvim-autopairs" }, -- autoclose parens, brackets, quotes, etc...
	{ "windwp/nvim-ts-autotag" }, -- autoclose tags

	-- errors
	{
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	},

	-- git integration
	{ "aspeddro/gitui.nvim" },
	{ "ThePrimeagen/git-worktree.nvim" },
	{ "lewis6991/gitsigns.nvim" }, -- show line modifications on left hand side
	{ "mbbill/undotree" }, --
	{ "tpope/vim-fugitive" }, --

	-- motion plugins
	{ "vim-scripts/ReplaceWithRegister" }, -- replace with register contents using motion (gr + motion)
	{ "mg979/vim-visual-multi" }, -- multiple cursors
	{ "tpope/vim-surround" }, -- add, delete, change surroundings (it's awesome)
	{ "numToStr/Comment.nvim" }, -- commenting with gc

	-- enlarge windows
	{ "szw/vim-maximizer" }, -- maximizes and restores current window
	{ "folke/zen-mode.nvim" }, -- zen mode
}
