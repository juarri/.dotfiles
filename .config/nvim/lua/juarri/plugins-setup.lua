-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- package manager

	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

	use("lewis6991/impatient.nvim") -- speeds up lua modules startup time

	use({
		"shiradofu/refresh.nvim",
		requires = "nvim-lua/plenary.nvim",
		run = "./refresh.sh restart",
	})

	use({
		"rmagatti/auto-session",
		config = function()
			require("auto-session").setup({
				log_level = "error",
				auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			})
		end,
	})

	-- colorscheme & icons
	use("olivercederborg/poimandres.nvim") -- colorscheme
	use("kyazdani42/nvim-web-devicons") -- vs-code like icons

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- navigation
	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
	use("akinsho/toggleterm.nvim") -- required by lf
	use({
		"lmburns/lf.nvim", -- file system
		requires = { "plenary.nvim", "toggleterm.nvim" },
	})
	use({
		"cbochs/grapple.nvim", -- immediate navigation to important files
		requires = { "nvim-lua/plenary.nvim" },
	})
	use("ggandor/leap.nvim") -- general-purpose motion plugin

	-- fuzzy finding w/ telescope
	use({
		"nvim-telescope/telescope.nvim", -- fuzzy finder
		requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	})

	use({ "nvim-telescope/telescope-fzy-native.nvim" }) -- dependency for better sorting performance
	use("nvim-telescope/telescope-file-browser.nvim")

	-- autocompletion
	use({ "hrsh7th/nvim-cmp", requires = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" } }) -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use({ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		requires = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",
		},
	})
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use("glepnir/lspsaga.nvim", { branch = "main" }) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
	use("j-hui/fidget.nvim")

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
	use("steelsojka/headwind.nvim") -- format tailwind classes

	-- treesitter configuration
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use({ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" })

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use("windwp/nvim-ts-autotag") -- autoclose tags

	-- errors
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- git integration
	use("aspeddro/gitui.nvim")
	use("ThePrimeagen/git-worktree.nvim")
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
	use("mbbill/undotree") --
	use("tpope/vim-fugitive") --

	-- motion plugins
	use("vim-scripts/ReplaceWithRegister") -- replace with register contents using motion (gr + motion)
	use("mg979/vim-visual-multi") -- multiple cursors
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("numToStr/Comment.nvim") -- commenting with gc

	-- enlarge windows
	use("szw/vim-maximizer") -- maximizes and restores current window
	use("folke/zen-mode.nvim") -- zen mode

	if packer_bootstrap then
		require("packer").sync()
	end
end)
