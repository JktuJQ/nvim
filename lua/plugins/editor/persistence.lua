local opts = {
	dir = vim.fn.stdpath("state") .. "/sessions/",
	need = 1,
	branch = true,
}

local keys = {
	{
		"<leader>ql",
		function()
			require("persistence").load()
		end,
		mode = "n",
		desc = "Restore session",
	},
	{
		"<leader>qs",
		function()
			require("persistence").select()
		end,
		mode = "n",
		desc = "Select session",
	},
	{
		"<leader>qd",
		function()
			require("persistence").stop()
		end,
		mode = "n",
		desc = "Detach session (session will not be saved)",
	},
}

return {
	"folke/persistence.nvim",

	event = "BufReadPre",

	opts = opts,
	keys = keys,
}
