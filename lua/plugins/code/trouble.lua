local opts = {
	open_no_results = true,
	auto_preview = false,
	win = {
		type = "split",
		relative = "win",
		position = "bottom",
		size = { height = 0.25 },
		wo = {
			winhighlight = "Normal:SnacksNormalNC,NormalNC:SnacksNormalNC",
		},
	},
	preview = {
		type = "main",
		size = { width = 0.5 },
		wo = {
			winhighlight = "Normal:SnacksNormalNC,NormalNC:SnacksNormalNC",
		},
	},
	modes = {
		symbols = { win = { position = "bottom" } },
		lsp = { win = { position = "bottom" } },
	},
}

local keys = {
	{
		"<leader>td",
		"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		mode = "n",
		desc = "Buffer diagnostics",
	},
	{
		"<leader>tD",
		"<cmd>Trouble diagnostics toggle<cr>",
		mode = "n",
		desc = "Diagnostics",
	},
	{
		"<leader>ts",
		"<cmd>Trouble symbols toggle<cr>",
		mode = "n",
		desc = "Symbols",
	},
	{
		"<leader>tl",
		"<cmd>Trouble lsp toggle<cr>",
		mode = "n",
		desc = "LSP definitions / references",
	},
	{
		"<leader>tL",
		"<cmd>Trouble loclist toggle<cr>",
		mode = "n",
		desc = "Location list",
	},
	{
		"<leader>tQ",
		"<cmd>Trouble qflist toggle<cr>",
		mode = "n",
		desc = "Quickfix list",
	},
}

return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	cmd = { "Trouble" },

	opts = opts,
	keys = keys,
}
