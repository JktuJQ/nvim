local opts = {
	hide_tabline = false,
}

local keys = {
	{
		"<leader>Z",
		":SimpleZoomToggle<CR>",
		mode = "n",
		desc = "Toggle zoom",
	},
}

return {
	"fasterius/simple-zoom.nvim",

	opts = opts,
	keys = keys,
}
