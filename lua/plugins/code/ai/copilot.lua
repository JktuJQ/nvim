local opts = {
    enabled = false,
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
	{
		"<leader>ct",
		function()
			local ok, Snacks = pcall(require, "snacks")
			if ok and Snacks.toggle then
				Snacks.toggle({
					name = "Copilot Completion",
					get = function()
						return not require("copilot.client").is_disabled()
					end,
					set = function(state)
						if state then
							vim.cmd("Copilot enable")
						else
							vim.cmd("Copilot disable")
						end
					end,
				}):toggle()
            end
		end,
		mode = "n",
		desc = "Toggle Copilot lsp",
	},
}

return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",

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
