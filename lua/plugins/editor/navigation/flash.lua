local opts = {
	highlight = {
		backdrop = false,
	},
	modes = {
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
		desc = "Flash (jump to character)",
	},
}

return {
	"folke/flash.nvim",

	opts = opts,
	keys = keys,
}
