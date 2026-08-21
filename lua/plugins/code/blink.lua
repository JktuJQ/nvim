local opts = {
	keymap = {
		preset = "default",
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<C-h>"] = { "show_documentation", "hide_documentation" },
		["<Tab>"] = { "accept", "fallback" },
	},
	appearance = { nerd_font_variant = "mono" },
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		providers = {
			lsp = { score_offset = 100 },
			snippets = { score_offset = 0 },
			path = { score_offset = 0 },
			buffer = { score_offset = 0 },
		},
	},
	completion = {
		ghost_text = { enabled = true },
		menu = {
			direction_priority = { "n", "s" },
		},
		list = {
			selection = {
				preselect = true,
				auto_insert = false,
			},
		},
	},
}

return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"L3MON4D3/LuaSnip",
		},
		version = "1.*",

		opts = opts,
		opts_extend = { "sources.default" },
	},
}
