local opts = {
	skip_confirm_for_simple_edits = true,
	view_options = {
		show_hidden = true,
	},
	keymaps = {
		["<CR>"] = "actions.select",
		["<C-c>"] = "actions.close",
		["<C-p>"] = "actions.preview",
		["-"] = "actions.parent",
		["_"] = "actions.open_cwd",
		["`"] = "actions.cd",
		["~"] = "actions.tcd",
		["cs"] = "actions.change_sort",
		["ox"] = "actions.open_external",
		["th"] = "actions.toggle_hidden",
	},
	float = {
		border = "rounded",
	},
	columns = {
		"icon",
	},
	confirmation = {
		border = "rounded",
	},
}

local keys = {
	{
		"<leader>o",
		function()
			require("oil").open_float()
		end,
		mode = "n",
		desc = "Open Oil file explorer in float",
	},
}

return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	lazy = false,

	cmd = { "Oil" },

	opts = opts,
	keys = keys,
}
