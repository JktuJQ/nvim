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
			["gt"] = { bottom = false, desc = "jump to top edge of scope" },
			["gb"] = { bottom = true, desc = "jump to bottom edge of scope" },
		},
	},
}

return {
	opts = opts,
}
