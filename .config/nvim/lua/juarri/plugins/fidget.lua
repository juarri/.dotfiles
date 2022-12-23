-- import plugin safely
local status, fidget = pcall(require, "fidget")
if not status then
	return
end

require("fidget").setup()
