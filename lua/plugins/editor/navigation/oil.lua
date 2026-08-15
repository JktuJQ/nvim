local opts = {
	default_file_explorer = true,

	delete_to_trash = false,

	skip_confirm_for_simple_edits = true,

	view_options = {
		show_hidden = true,
		is_always_hidden = function(_, _)
			return false
		end,
	},

	keymaps = {
		["<CR>"] = "actions.select",
		["<C-v>"] = false,
		["<C-x>"] = false,
		["<C-t>"] = false,
		["<C-p>"] = "actions.preview",
		["<C-c>"] = "actions.close",
		["-"] = "actions.parent",
		["_"] = "actions.open_cwd",
		["`"] = "actions.cd",
		["~"] = "actions.tcd",
		["cs"] = "actions.change_sort",
		["ox"] = "actions.open_external",
		["th"] = "actions.toggle_hidden",
	},

	win = {
		border = "rounded",
		width = 40,
		height = 20,
		winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
	},

	float = {
		padding = 2,
		max_width = 0.6,
		max_height = 0.6,
		border = "rounded",
	},

	columns = {
		"icon",
	},

	confirm = {
		border = "rounded",
	},
}

local config = function()
	require("oil").setup(opts)

	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
end

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

	cmd = { "Oil" },

	opts = opts,
	config = config,
	keys = keys,
}
