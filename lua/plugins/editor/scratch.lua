local opts = {
	ft = "markdown",
	cmd = "Scratch",
	name = "Scratch",
	autowrite = true,
	persist = true,
}

local keys = {
	{
		"<leader>s",
		function()
			require("snacks").scratch({ ft = vim.bo.filetype })
		end,
		mode = "n",
		desc = "Toggle scratch buffer",
	},
	{
		"<leader>ss",
		function()
			require("snacks").scratch.select()
		end,
		mode = "n",
		desc = "Select scratch buffer",
	},
}

return {
	"folke/snacks.nvim",

	opts = { scratch = opts },
	keys = keys,
}
