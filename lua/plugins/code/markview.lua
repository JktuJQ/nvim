local opts = {
	preview = {
		icon_provider = "devicons",
	},
}

return {
	"OXY2DEV/markview.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",

		"saghen/blink.cmp",
	},

	lazy = false,

	opts = opts,
}
