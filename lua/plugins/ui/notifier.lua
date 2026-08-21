local opts = {
	enabled = true,
	timeout = 2000,
}

local keys = {
	{
		"<leader>nh",
		function()
			Snacks.notifier.show_history()
		end,
		mode = "n",
		desc = "Notification history",
	},
}

return {
	"folke/snacks.nvim",

	opts = { notifier = opts },
	keys = keys,
}
