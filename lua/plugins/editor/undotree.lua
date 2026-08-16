local opts = {
	layout = {
		direction = "right",
        width = 0.3,
	},
}

local keys = {
	{
		"<leader>ut",
		function()
			vim.cmd("Atone toggle")
		end,
		mode = "n",
		desc = "Toggle undotree",
	},
}

return {
	"XXiaoA/atone.nvim",
	cmd = "Atone",

	opts = opts,
	keys = keys,
}
