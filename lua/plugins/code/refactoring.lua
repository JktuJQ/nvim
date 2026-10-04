local keys = {
	{
		"<leader>rs",
		function()
			require("refactoring").select_refactor()
		end,
		mode = { "n", "x" },
		desc = "Select refactor",
	},
	{
		"<leader>ref",
		function()
			return require("refactoring").extract_func()
		end,
		mode = { "n", "x" },
		expr = true,
		desc = "Extract function",
	},
	{
		"<leader>rev",
		function()
			return require("refactoring").extract_var()
		end,
		mode = { "n", "x" },
		expr = true,
		desc = "Extract variable",
	},
	{
		"<leader>riv",
		function()
			return require("refactoring").inline_var()
		end,
		mode = { "n", "x" },
		expr = true,
		desc = "Inline variable",
	},
	{
		"<leader>rif",
		function()
			return require("refactoring").inline_func()
		end,
		mode = { "n", "x" },
		expr = true,
		desc = "Inline function",
	},
}

return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = { "lewis6991/async.nvim", "nvim-treesitter/nvim-treesitter" },

	keys = keys,
}
