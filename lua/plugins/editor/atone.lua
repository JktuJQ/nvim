local opts = {
	layout = {
		direction = "right",
		width = 0.25,
	},
	diff_cur_node = {
		split_percent = 0.4,
	},
}

local config = function()
	require("atone").setup(opts)
end

local keys = {
	{
		"<leader>ut",
		"<cmd>Atone toggle<cr>",
		mode = "n",
		desc = "Toggle undo tree",
	},
}

return {
	"XXiaoA/atone.nvim",
	cmd = "Atone",

	opts = opts,
	config = config,
	keys = keys,
}
