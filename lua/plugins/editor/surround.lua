local config = function()
	vim.g.nvim_surround_no_normal_mappings = true
	vim.g.nvim_surround_no_visual_mappings = true
end

local keys = {
	{
		"as",
		"<Plug>(nvim-surround-normal)",
		mode = "n",
		desc = "Add surround ({motion}{char})",
	},
	{
		"ds",
		"<Plug>(nvim-surround-delete)",
		mode = "n",
		desc = "Delete surround ({char})",
	},
	{
		"cs",
		"<Plug>(nvim-surround-change)",
		mode = "n",
		desc = "Change surround ({target}{replacement})",
	},
	{
		"S",
		"<Plug>(nvim-surround-visual)",
		mode = "x",
		desc = "Add surround (visual)",
	},
}

return {
	"kylechui/nvim-surround",
	event = "VeryLazy",

	config = config,
	keys = keys,
}
