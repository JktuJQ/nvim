local opts = {
    enabled = true,
}

local keys = {
	{
		"<leader>sb",
		function()
			require("snacks").scratch({ ft = vim.bo.filetype })
		end,
		mode = "n",
		desc = "Toggle scratch buffer",
	},
	{
		"<leader>Sb",
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
