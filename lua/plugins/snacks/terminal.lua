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
	opts = opts,
	keys = keys,
}
