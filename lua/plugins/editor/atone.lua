local opts = {
	layout = {
		direction = "right",
		width = 0.25,
	},
    diff_cur_node = {
        split_percent = 0.4,
        width = 0.4
    }
}

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
	keys = keys,
}
