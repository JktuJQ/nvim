local opts = {
	enabled = true,
	win = {
        enter = false,
		height = 0.25,
		relative = "win",
		wo = {
			winbar = "",
            winhighlight = "Normal:SnacksNormalNC,NormalNC:SnacksNormalNC",
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
