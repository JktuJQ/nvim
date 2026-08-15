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
	{
		"S",
		mode = { "n", "x", "o" },
		function()
			require("flash").treesitter()
		end,
		desc = "Flash Treesitter",
	},
	{
		"r",
		mode = "o",
		function()
			require("flash").remote()
		end,
		desc = "Remote flash",
	},
	{
		"R",
		mode = { "o", "x" },
		function()
			require("flash").treesitter_search()
		end,
		desc = "Treesitter search",
	},
}

return {
	"folke/flash.nvim",

	opts = opts,
	keys = keys,
}
