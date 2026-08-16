local opts = {}

local keys = {
	{
		"<leader>td",
		"<cmd>Trouble diagnostics toggle<cr>",
		mode = "n",
		desc = "Diagnostics (Trouble)",
	},
	{
		"<leader>tD",
		"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		mode = "n",
		desc = "Buffer Diagnostics (Trouble)",
	},
	{
		"<leader>ts",
		"<cmd>Trouble symbols toggle focus=false win.position=right win.size=40<cr>",
		mode = "n",
		desc = "Symbols (Trouble)",
	},
	{
		"<leader>tl",
		"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		mode = "n",
		desc = "LSP Definitions / references (Trouble)",
	},
	{
		"<leader>tL",
		"<cmd>Trouble loclist toggle<cr>",
		mode = "n",
		desc = "Location List (Trouble)",
	},
	{
		"<leader>tQ",
		"<cmd>Trouble qflist toggle<cr>",
		mode = "n",
		desc = "Quickfix List (Trouble)",
	},
}

return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	cmd = { "Trouble" },

	opts = opts,
	keys = keys,
}
