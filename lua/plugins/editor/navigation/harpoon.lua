local config = function()
	require("harpoon"):setup()
end

local keys = {
	{
		"<leader>ha",
		function()
			require("harpoon"):list():add()
		end,
		mode = "n",
		desc = "Add file to harpoon",
	},
	{
		"<leader>h",
		function()
			local harpoon = require("harpoon")
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end,
		mode = "n",
		desc = "Toggle harpoon menu",
	},
	{
		"<leader>h1",
		function()
			require("harpoon"):list():select(1)
		end,
		mode = "n",
		desc = "Jump to harpoon file 1",
	},
	{
		"<leader>h2",
		function()
			require("harpoon"):list():select(2)
		end,
		mode = "n",
		desc = "Jump to harpoon file 2",
	},
	{
		"<leader>h3",
		function()
			require("harpoon"):list():select(3)
		end,
		mode = "n",
		desc = "Jump to harpoon file 3",
	},
	{
		"<leader>h4",
		function()
			require("harpoon"):list():select(4)
		end,
		mode = "n",
		desc = "Jump to harpoon file 4",
	},
	{
		"<leader>h5",
		function()
			require("harpoon"):list():select(5)
		end,
		mode = "n",
		desc = "Jump to harpoon file 5",
	},
	{
		"<leader>hh",
		function()
			require("harpoon"):list():prev()
		end,
		mode = "n",
		desc = "Previous harpoon file",
	},
	{
		"<leader>hl",
		function()
			require("harpoon"):list():next()
		end,
		mode = "n",
		desc = "Next harpoon file",
	},
}

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = config,
	keys = keys,
}
