local opts = {
	options = {
		separator_style = { " ", " " },
		indicator = {
			style = "underline",
		},
		show_buffer_close_icons = false,
		show_close_icon = false,
        always_show_bufferline = false,

		highlights = function()
			require("catppuccin.special.bufferline").get_theme()
		end,

		offsets = {
			{
				filetype = "snacks_layout_box",
				text = "󰉓 ",
				highlight = "Directory",
				text_align = "center",
				separator = false,
			},
		},

		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(_, _, diag)
			local ret = ""
			if diag.error then
				ret = ret .. " " .. diag.error .. " "
			end
			if diag.warning then
				ret = ret .. " " .. diag.warning
			end
			return vim.trim(ret)
		end,
	},
}

local keys = {
	{
		"<leader>bp",
		"<Cmd>BufferLineTogglePin<CR>",
		mode = "n",
		desc = "Pin buffer",
	},
	{
		"<leader>bdp",
		"<Cmd>BufferLineGroupClose ungrouped<CR>",
		mode = "n",
		desc = "Delete non-pinned buffers",
	},
	{
		"<leader>bdl",
		"<Cmd>BufferLineCloseLeft<CR>",
		mode = "n",
		desc = "Delete buffers to the left",
	},
	{
		"<leader>bdr",
		"<Cmd>BufferLineCloseRight<CR>",
		mode = "n",
		desc = "Delete buffers to the right",
	},
	{
		"<A-h>",
		"<cmd>BufferLineCyclePrev<cr>",
		mode = "n",
		desc = "Go to previous buffer",
	},
	{
		"<A-l>",
		"<cmd>BufferLineCycleNext<cr>",
		mode = "n",
		desc = "Go to next buffer",
	},
	{
		"<A-H>",
		"<cmd>BufferLineMovePrev<cr>",
		mode = "n",
		desc = "Move buffer to the left",
	},
	{
		"<A-L>",
		"<cmd>BufferLineMoveNext<cr>",
		mode = "n",
		desc = "Move buffer to the right",
	},
	{
		"<leader>bf",
		"<cmd>BufferLinePick<cr>",
		mode = "n",
		desc = "Pick Buffer",
	},
}

return {
	"akinsho/bufferline.nvim",
	after = "catppuccin",

	event = "VeryLazy",

	opts = opts,
	config = config,
	keys = keys,
}
