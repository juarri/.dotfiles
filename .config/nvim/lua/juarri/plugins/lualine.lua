-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
	return
end

-- configure lualine with modified theme
lualine.setup({
	options = {
		icons_enabled = true,
		theme = "poimandres",
		disabled_filetypes = {},
		-- section_separators = { left = '', right = '' },
		-- component_separators = { left = '', right = '' },
		section_separators = {},
		component_separators = {},
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			{ "filename", path = 1 },
			{
				function()
					local key = require("grapple").key()
					return "  [" .. key .. "]"
				end,
				cond = require("grapple").exists,
			},
		},

		lualine_x = { "diagnostics", "diff", "filetype" },
		lualine_y = { "location" },
		lualine_z = { "progress" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = { "branch" },
		lualine_c = {
			{ "filename", path = 1 },
			{
				function()
					local key = require("grapple").key()
					return "  [" .. key .. "]"
				end,
				cond = require("grapple").exists,
			},
		},
		lualine_x = { "filetype" },
		lualine_y = { "location" },
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
