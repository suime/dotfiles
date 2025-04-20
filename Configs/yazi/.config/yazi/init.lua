local catppuccin_theme = require("yatline-catppuccin"):setup("mocha") -- or "latte" | "frappe" | "macchiato"
--require("git"):setup()
require("duckdb"):setup({
	mode = "standard", -- Default: "summarized"
	row_id = true, -- Default: false
	minmax_column_width = 30, -- Default: 21
})

require("yatline"):setup({
	show_background = false,
	theme = catppuccin_theme,
	header_line = {
		left = {
			section_a = {
				{ type = "line", custom = false, name = "tabs", params = { "left" } },
			},
			section_b = {},
			section_c = {},
		},
		right = {
			section_a = {},
			section_b = {},
			section_c = {
				{ type = "coloreds", custom = false, name = "count" },
			},
		},
	},

	status_line = {
		left = {
			section_a = {},
			section_b = {},
			section_c = {},
		},
		right = {
			section_a = {},
			section_b = {},
			section_c = {},
		},
	},
})
