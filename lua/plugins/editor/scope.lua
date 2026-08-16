local opts = {
	enabled = true,
	keys = {
		textobject = {
			is = { desc = "Inner scope" },
			as = { desc = "Around scope" },
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
