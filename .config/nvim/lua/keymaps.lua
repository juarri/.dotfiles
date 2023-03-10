-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<cr>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- URL handling
-- source: https://sbulav.github.io/vim/neovim-opening-urls/
if vim.fn.has("mac") == 1 then
	keymap.set("", "gx", '<Cmd>call jobstart(["open", expand("<cfile>")], {"detach": v:true})<CR>', {})
elseif vim.fn.has("unix") == 1 then
	keymap.set("", "gx", '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>', {})
else
	keymap.set[""].gx = { '<Cmd>lua print("Error: gx is not supported on this OS!")<CR>' }
end

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<cr>") -- close current split window

-- tab management
keymap.set("n", "<leader>tc", "<cmd>tabnew<cr>") -- create new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<cr>") -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<cr>") --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<cr>") --  go to previous tab

-- tmux
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<cr>")

----------------------
-- Plugin Keybinds
----------------------

-- zen mode
vim.keymap.set("n", "<leader>z", function()
	require("zen-mode").toggle()
	vim.wo.wrap = false
end)

-- inc-rename
keymap.set("n", "<leader>rn", "<cmd>IncRename<cr>")

-- vim-maximizer
keymap.set("n", "<leader>sm", "<cmd>MaximizerToggle<cr>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", "<cmd>lua require('lf').start()<cr>", { noremap = true })

-- gitui
keymap.set("n", "<leader>gg", require("gitui").open) -- toggle lazy git explorer

-- telescope
-- See `:help telescope.builtin`
keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] find recently opened files" })
keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer]" })

keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gf", "<cmd>Telescope git_files<cr>") -- list all git files (use <cr> to checkout) ["gf" for git files]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]
keymap.set("n", "<leader>gtt", require("telescope").extensions.git_worktree.git_worktrees) -- list current worktrees ["gw" for git worktrees]
keymap.set("n", "<leader>gtc", require("telescope").extensions.git_worktree.create_git_worktree) -- create worktree ["gwc" for git create worktree]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", "<cmd>LspRestart<cr>") -- mapping to restart lsp if necessary

-- trouble
keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })

-- grapple
keymap.set("n", "<leader>ff", require("grapple").popup_tags, {})
keymap.set("n", "<leader>ft", require("grapple").toggle, {})

for i = 1, 9 do
	keymap.set("n", string.format("<leader>f%s", i), function()
		require("grapple").select({ key = i })
	end, {})
end
