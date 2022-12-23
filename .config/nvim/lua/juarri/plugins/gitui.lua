-- import plugin safely
local setup, gitui = pcall(require, "gitui")
if not setup then
	return
end

require("gitui").setup()
