local opts = {
	enabled = true,
	config = {
		os = {
			editPreset = "nvim-remote",
		},
		gui = {
			nerdFontsVersion = "3",
		},
	},
	win = {
		style = "lazygit",
		relative = "editor",
		width = 0.9,
		height = 0.9,
	},
}

local keys = {
	{
		"<leader>gg",
		function()
			Snacks.lazygit()
		end,
		mode = "n",
		desc = "Open Lazygit",
	},
}

return {
	"folke/snacks.nvim",

	opts = { lazygit = opts },
	keys = keys,
}
