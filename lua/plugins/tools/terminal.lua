local opts = {
	enabled = true,
}

local keys = {
	{
		"<C-t>",
		function()
			Snacks.terminal.toggle()
		end,
		mode = { "n", "t" },
		desc = "Toggle terminal",
	},
}

return {
	"folke/snacks.nvim",

	opts = { terminal = opts },
	keys = keys,
}
