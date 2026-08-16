local opts = {
	preset = {
		keys = {
			{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
			{ icon = " ", key = "m", desc = "Filetree", action = ":lua Snacks.explorer()" },
			{
				icon = "󰒓 ",
				key = "c",
				desc = "Config",
				action = ":lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })",
			},
			{ icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
		},
	},
	sections = {
		{ section = "header" },
		{
			pane = 2,
			section = "terminal",
			cmd = "colorscript -e square",
			height = 5,
			padding = 1,
		},
		{ section = "keys", gap = 1, padding = 1 },
		{
			pane = 2,
			icon = "󰈞 ",
			title = "Recent Files",
			section = "recent_files",
			limit = 6,
			indent = 2,
			padding = 1,
			action = function(item)
				Snacks.explorer(item.file)
			end,
		},
		{
			pane = 2,
			icon = "󰉋 ",
			title = "Projects",
			section = "projects",
			limit = 4,
			indent = 2,
			padding = 1,
			action = function(item)
				Snacks.explorer(item.file)
			end,
		},
		{ section = "startup" },
	},
}

return {
	"folke/snacks.nvim",

	opts = { dashboard = opts },
}
