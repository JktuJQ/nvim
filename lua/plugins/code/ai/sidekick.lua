local opts = {
	nes = {
		enabled = true,
	},

	cli = {
		mux = {
			enabled = true,
			backend = "tmux",
		},
	},

	prompts = {
		refactor = "Can you refactor {this} to adhere to the codebase style and to be more mantainable?",
		security = "Are there any security vulnerabilities in {this}?",
	},
}

local keys = {
	-- NES
	{
		"<leader>an",
		function()
			require("sidekick.nes").toggle()
		end,
		mode = "n",
		desc = "Toggle NES",
	},
	{
		"<leader>ans",
		function()
			require("sidekick.nes").have()
		end,
		mode = "n",
		desc = "Check for NES suggestions",
	},
	{
		"<leader>aj",
		function()
			require("sidekick.nes").jump()
		end,
		mode = "n",
		desc = "NES jump to next suggestion",
	},
	{
		"<leader>aa",
		function()
			require("sidekick.nes").apply()
		end,
		mode = "n",
		desc = "NES apply suggestion",
	},

	-- CLI
	{
		"<leader>ai",
		function()
			require("sidekick.cli").toggle()
		end,
		mode = "n",
		desc = "Toggle AI CLI",
	},
	{
		"<leader>ad",
		function()
			require("sidekick.cli").close()
		end,
		mode = "n",
		desc = "Detach/close CLI session",
	},

	-- send context
	{
		"<leader>ast",
		function()
			require("sidekick.cli").send({ msg = "{this}" })
		end,
		mode = { "n", "v" },
		desc = "Send 'this'",
	},
	{
		"<leader>asv",
		function()
			require("sidekick.cli").send({ msg = "{selection}" })
		end,
		mode = "v",
		desc = "Send selection",
	},
	{
		"<leader>asl",
		function()
			require("sidekick.cli").send({ msg = "{line}" })
		end,
		mode = "n",
		desc = "Send current line",
	},
	{
		"<leader>asF",
		function()
			require("sidekick.cli").send({ msg = "{file}" })
		end,
		mode = "n",
		desc = "Send current file",
	},
	{
		"<leader>asf",
		function()
			require("sidekick.cli").send({ msg = "{function}" })
		end,
		mode = "n",
		desc = "Send function under cursor",
	},
	{
		"<leader>asc",
		function()
			require("sidekick.cli").send({ msg = "{class}" })
		end,
		mode = "n",
		desc = "Send class under cursor",
	},
	{
		"<leader>asd",
		function()
			require("sidekick.cli").send({ msg = "{diagnostics}" })
		end,
		mode = "n",
		desc = "Send diagnostics for current file",
	},
	{
		"<leader>asD",
		function()
			require("sidekick.cli").send({ msg = "{diagnostics_all}" })
		end,
		mode = "n",
		desc = "Send all diagnostics",
	},

	-- prompts
	{
		"<leader>ap",
		function()
			require("sidekick.cli").prompt()
		end,
		mode = "n",
		desc = "Select and send prompt",
	},
}

return {
	{
		"folke/sidekick.nvim",
		version = "*",
		dependencies = {
			"zbirenbaum/copilot.lua",
		},

		opts = opts,
		keys = keys,
	},
	{
		"folke/snacks.nvim",
		optional = true,

		opts = {
			picker = {
				actions = {
					sidekick_send = function(...)
						return require("sidekick.cli.picker.snacks").send(...)
					end,
				},
				win = {
					input = {
						keys = {
							["<A-s>"] = { "sidekick_send", mode = { "n", "i" } },
						},
					},
				},
			},
		},
	},
}
