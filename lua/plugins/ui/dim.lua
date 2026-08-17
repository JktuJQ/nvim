local opts = {
	enabled = true,
	scope = {
		min_size = 5,
		max_size = 20,
		siblings = true,
	},
}

local keys = {
	{
		"<leader>ttd",
		function()
			Snacks.toggle.dim():toggle()
		end,
		mode = "n",
		desc = "Toggle dim mode",
	},
}

return {
	"folke/snacks.nvim",

	opts = { dim = opts },
	keys = keys,
}
