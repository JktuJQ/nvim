local opts = {
	enabled = true,
	treesitter = { enabled = true },
	cursor = false,
	edge = false,
	keys = {
		textobject = {
			is = {
				desc = "inner scope",
				edge = true,
				cursor = false,
				min_size = 2,
				treesitter = { blocks = { enabled = true } },
			},
			as = {
				desc = "around scope",
				cursor = false,
				min_size = 2,
				treesitter = { blocks = { enabled = true } },
			},
		},
		jump = {
			["gt"] = { bottom = false, desc = "Jump to top edge of scope" },
			["gb"] = { bottom = true, desc = "Jump to bottom edge of scope" },
		},
	},
}

return {
	"folke/snacks.nvim",

	opts = { scope = opts },
}
