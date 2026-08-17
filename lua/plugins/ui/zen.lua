local opts = {
	enabled = true,
	center = true,
}

local keys = {
	{
		"<leader>ttz",
		function()
			Snacks.toggle.zen():toggle()
		end,
		mode = "n",
		desc = "Toggle zen mode",
	},
}

return {
	"folke/snacks.nvim",

	opts = { zen = opts },
	keys = keys,
}
