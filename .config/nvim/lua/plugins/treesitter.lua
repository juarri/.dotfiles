return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			ensure_installed = "all", -- one of "all" or a list of languages
			sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
			auto_install = true,
			ignore_install = { "" }, -- List of parsers to ignore installing

			autopairs = {
				enable = true,
			},

			autotag = {
				enable = true,
			},

			indent = {
				enable = true,
			},

			highlight = {
				enable = true, -- false will disable the whole extension
				disable = {}, -- list of language that will be disabled
				additional_vim_regex_highlighting = false,
			},

			rainbow = {
				enable = false,
				-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
				extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
				max_file_lines = nil, -- Do not enable for files with more than n lines, int
				-- colors = {}, -- table of hex strings
				-- termcolors = {} -- table of colour name strings
			},

			context_commentstring = {
				enable = true,
				enable_autocmd = true,
				config = {
					-- Languages that have a single comment style
					typescript = { __default = "// %s", __multiline = "/* %s */" },
					css = "/* %s */",
					scss = { __default = "// %s", __multiline = "/* %s */" },
					php = { __default = "// %s", __multiline = "/* %s */" },
					html = "<!-- %s -->",
					svelte = "<!-- %s -->",
					vue = "<!-- %s -->",
					handlebars = "{{! %s }}",
					glimmer = "{{! %s }}",
					graphql = "# %s",
					lua = { __default = "-- %s", __multiline = "--[[ %s ]]" },
					vim = '" %s',

					-- Languages that can have multiple types of comments
					tsx = {
						__default = "// %s",
						__multiline = "/* %s */",
						jsx_element = "{/* %s */}",
						jsx_fragment = "{/* %s */}",
						jsx_attribute = { __default = "// %s", __multiline = "/* %s */" },
						comment = { __default = "// %s", __multiline = "/* %s */" },
						call_expression = { __default = "// %s", __multiline = "/* %s */" },
						statement_block = { __default = "// %s", __multiline = "/* %s */" },
						spread_element = { __default = "// %s", __multiline = "/* %s */" },
					},

					javascript = {
						__default = "// %s",
						__multiline = "/* %s */",
						jsx_element = "{/* %s */}",
						jsx_fragment = "{/* %s */}",
						jsx_attribute = { __default = "// %s", __multiline = "/* %s */" },
						comment = { __default = "// %s", __multiline = "/* %s */" },
						call_expression = { __default = "// %s", __multiline = "/* %s */" },
						statement_block = { __default = "// %s", __multiline = "/* %s */" },
						spread_element = { __default = "// %s", __multiline = "/* %s */" },
					},
				},
			},
		})
	end,
}
