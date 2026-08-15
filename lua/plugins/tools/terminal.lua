local opts = {
	enabled = true,
	position = "float",
	win = {
		style = "terminal",
		position = "float",
		border = "rounded",
		title = "Terminal",
		wo = {
			winbar = "",
		},
	},
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
