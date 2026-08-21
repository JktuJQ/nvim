local opts = {
	suggestion = { enabled = false },
	panel = { enabled = false },
	server = {
		type = "binary",
		custom_server_filepath = vim.fn.exepath("copilot-language-server"),
	},
}

local keys = {
	{
		"<leader>ca",
		function()
			vim.cmd("Copilot auth")
		end,
		mode = "n",
		desc = "Copilot auth",
	},
	{
		"<leader>cs",
		function()
			vim.cmd("Copilot status")
		end,
		mode = "n",
		desc = "Copilot status",
	},
}

return {
	{
		"zbirenbaum/copilot.lua",

		cmd = "Copilot",
		event = "InsertEnter",

		opts = opts,
		keys = keys,
	},
	{
		"saghen/blink.cmp",
		optional = true,
		dependencies = { "fang2hou/blink-copilot" },
		opts = {
			sources = {
				default = { "copilot" },
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-copilot",
						async = true,
					},
				},
			},
		},
	},
}
