local opts = {
	enabled = true,
	replace_netrw = false,
	trash = true,
	win = {
		style = "sidebar",
		position = "left",
		width = 30,
	},
}

local keys = {
	{
		"<C-m>",
		function()
			Snacks.explorer()
		end,
		mode = "n",
		desc = "Toggle explorer",
	},
}

return {
	"folke/snacks.nvim",

	opts = { explorer = opts },
	keys = keys,
}
