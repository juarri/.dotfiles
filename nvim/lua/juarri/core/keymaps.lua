-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- format
vim.keymap.set("n", "<leader>F", function()
	vim.lsp.buf.format()
end)

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
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>tc", ":tabnew<CR>") -- create new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- tmux
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

----------------------
-- Plugin Keybinds
----------------------

-- zen mode
vim.keymap.set("n", "<leader>z", function()
	require("zen-mode").toggle()
	vim.wo.wrap = false
end)

-- inc-rename
keymap.set("n", "<leader>rn", ":IncRename")

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", "<cmd>lua require('lf').start()<CR>", { noremap = true })

-- lazy git
keymap.set("n", "<leader>gg", ":LazyGit<CR>") -- toggle lazy git explorer

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
keymap.set("n", "<leader>gw", require("telescope").extensions.git_worktree.git_worktrees) -- list current worktrees ["gw" for git worktrees]
keymap.set("n", "<leader>gt", require("telescope").extensions.git_worktree.create_git_worktree) -- create worktree ["gwc" for git create worktree]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

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

keymap.set("n", "<leader>f1", function()
	require("grapple").select({ key = 1 })
end, {})
keymap.set("n", "<leader>f2", function()
	require("grapple").select({ key = 2 })
end, {})
keymap.set("n", "<leader>f3", function()
	require("grapple").select({ key = 3 })
end, {})
keymap.set("n", "<leader>f4", function()
	require("grapple").select({ key = 4 })
end, {})
keymap.set("n", "<leader>f5", function()
	require("grapple").select({ key = 5 })
end, {})
keymap.set("n", "<leader>f6", function()
	require("grapple").select({ key = 6 })
end, {})
keymap.set("n", "<leader>f7", function()
	require("grapple").select({ key = 7 })
end, {})
keymap.set("n", "<leader>f8", function()
	require("grapple").select({ key = 8 })
end, {})
keymap.set("n", "<leader>f9", function()
	require("grapple").select({ key = 9 })
end, {})
