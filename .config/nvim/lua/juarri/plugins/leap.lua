-- import plugin safely
local status, leap = pcall(require, "leap")
if not status then
	return
end

require("leap").add_default_mappings()
