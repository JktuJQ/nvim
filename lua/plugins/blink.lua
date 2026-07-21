local opts = {
	keymap = { preset = "default" },
	appearance = { nerd_font_variant = "mono" },
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
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
	},
}
