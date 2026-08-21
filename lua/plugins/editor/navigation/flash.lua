local opts = {
	highlight = {
		backdrop = false,
	},
	modes = {
		search = {
			enabled = true,
		},
		char = {
			enabled = true,
			highlight = {
				backdrop = false,
			},
			jump_labels = true,
			multi_line = true,
			labels = "qwertyuiopasdfghjklzxcvbnm",
		},
	},
}

local keys = {
	{
		"s",
		mode = { "n", "x", "o" },
		function()
			require("flash").jump()
		end,
		desc = "Search character",
	},
}

return {
	"folke/flash.nvim",

	opts = opts,
	keys = keys,
}
