local treesitter_opts = {
	ensure_installed = {
		"nix",
		"lua",
		"rust",
		"haskell",
		"bash",
		"c",
		"cpp",
		"java",
		"python",
		"go",
		"toml",
		"json",
		"yaml",
		"markdown",
		"latex",
	},
	auto_install = true,
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
	},
}

local treesitter_textobjects_opts = {
	select = {
		enable = true,
		lookahead = true,
		selection_modes = {
			["@parameter.outer"] = "v",
			["@function.outer"] = "V",
			["@class.outer"] = "<c-v>",
		},
		include_surrounding_whitespace = false,
	},
	move = {
		enable = true,
		set_jumps = true,
	},
	swap = {
		enable = true,
	},
}

local treesitter_textobjects_keys = {
	{
		"if",
		function()
			require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
		end,
		mode = { "x", "o" },
		desc = "Inner function",
	},
	{
		"af",
		function()
			require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
		end,
		mode = { "x", "o" },
		desc = "Around function",
	},
	{
		"ic",
		function()
			require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
		end,
		mode = { "x", "o" },
		desc = "Inner class",
	},
	{
		"ac",
		function()
			require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
		end,
		mode = { "x", "o" },
		desc = "Around class",
	},
	{
		"ib",
		function()
			require("nvim-treesitter-textobjects.select").select_textobject("@block.inner", "textobjects")
		end,
		mode = { "x", "o" },
		desc = "Inner block",
	},
	{
		"ab",
		function()
			require("nvim-treesitter-textobjects.select").select_textobject("@block.outer", "textobjects")
		end,
		mode = { "x", "o" },
		desc = "Around block",
	},
	{
		"il",
		function()
			require("nvim-treesitter-textobjects.select").select_textobject("@loop.inner", "textobjects")
		end,
		mode = { "x", "o" },
		desc = "Inner loop",
	},
	{
		"al",
		function()
			require("nvim-treesitter-textobjects.select").select_textobject("@loop.outer", "textobjects")
		end,
		mode = { "x", "o" },
		desc = "Around loop",
	},
	{
		"ii",
		function()
			require("nvim-treesitter-textobjects.select").select_textobject("@conditional.inner", "textobjects")
		end,
		mode = { "x", "o" },
		desc = "Inner conditional",
	},
	{
		"ai",
		function()
			require("nvim-treesitter-textobjects.select").select_textobject("@conditional.outer", "textobjects")
		end,
		mode = { "x", "o" },
		desc = "Around conditional",
	},
	{
		"ip",
		function()
			require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
		end,
		mode = { "x", "o" },
		desc = "Inner parameter",
	},
	{
		"ap",
		function()
			require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
		end,
		mode = { "x", "o" },
		desc = "Around parameter",
	},

	-- move
	{
		"]f",
		function()
			require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "Next function start",
	},
	{
		"]F",
		function()
			require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "Next function end",
	},
	{
		"[f",
		function()
			require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "Previous function start",
	},
	{
		"[F",
		function()
			require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "Previous function end",
	},

	{
		"]c",
		function()
			require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "Next class start",
	},
	{
		"]C",
		function()
			require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "Next class end",
	},
	{
		"[c",
		function()
			require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "Previous class start",
	},
	{
		"[C",
		function()
			require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "Previous class end",
	},

	{
		"]b",
		function()
			require("nvim-treesitter-textobjects.move").goto_next_start("@block.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "Next block start",
	},
	{
		"]B",
		function()
			require("nvim-treesitter-textobjects.move").goto_next_end("@block.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "Next block end",
	},
	{
		"[b",
		function()
			require("nvim-treesitter-textobjects.move").goto_previous_start("@block.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "Previous block start",
	},
	{
		"[B",
		function()
			require("nvim-treesitter-textobjects.move").goto_previous_end("@block.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "Previous block end",
	},

	{
		"]l",
		function()
			require("nvim-treesitter-textobjects.move").goto_next_start("@loop.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "Next loop start",
	},
	{
		"]L",
		function()
			require("nvim-treesitter-textobjects.move").goto_next_end("@loop.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "Next loop end",
	},
	{
		"[l",
		function()
			require("nvim-treesitter-textobjects.move").goto_previous_start("@loop.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "Previous loop start",
	},
	{
		"[L",
		function()
			require("nvim-treesitter-textobjects.move").goto_previous_end("@loop.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "Previous loop end",
	},

	{
		"]i",
		function()
			require("nvim-treesitter-textobjects.move").goto_next_start("@conditional.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "Next conditional start",
	},
	{
		"]I",
		function()
			require("nvim-treesitter-textobjects.move").goto_next_end("@conditional.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "Next conditional end",
	},
	{
		"[i",
		function()
			require("nvim-treesitter-textobjects.move").goto_previous_start("@conditional.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "Previous conditional start",
	},
	{
		"[I",
		function()
			require("nvim-treesitter-textobjects.move").goto_previous_end("@conditional.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "Previous conditional end",
	},

	{
		"]p",
		function()
			require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "Next parameter start",
	},
	{
		"]P",
		function()
			require("nvim-treesitter-textobjects.move").goto_next_end("@parameter.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "Next parameter end",
	},
	{
		"[p",
		function()
			require("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "Previous parameter start",
	},
	{
		"[P",
		function()
			require("nvim-treesitter-textobjects.move").goto_previous_end("@parameter.outer", "textobjects")
		end,
		mode = { "n", "x", "o" },
		desc = "Previous parameter end",
	},

	-- swap
	{
		"<leader>sf",
		function()
			require("nvim-treesitter-textobjects.swap").swap_next("@function.outer")
		end,
		mode = "n",
		desc = "Swap function next",
	},
	{
		"<leader>Sf",
		function()
			require("nvim-treesitter-textobjects.swap").swap_previous("@function.outer")
		end,
		mode = "n",
		desc = "Swap function previous",
	},

	{
		"<leader>sc",
		function()
			require("nvim-treesitter-textobjects.swap").swap_next("@class.outer")
		end,
		mode = "n",
		desc = "Swap class next",
	},
	{
		"<leader>Sc",
		function()
			require("nvim-treesitter-textobjects.swap").swap_previous("@class.outer")
		end,
		mode = "n",
		desc = "Swap class previous",
	},

	{
		"<leader>sb",
		function()
			require("nvim-treesitter-textobjects.swap").swap_next("@block.outer")
		end,
		mode = "n",
		desc = "Swap block next",
	},
	{
		"<leader>Sb",
		function()
			require("nvim-treesitter-textobjects.swap").swap_previous("@block.outer")
		end,
		mode = "n",
		desc = "Swap block previous",
	},

	{
		"<leader>sl",
		function()
			require("nvim-treesitter-textobjects.swap").swap_next("@loop.outer")
		end,
		mode = "n",
		desc = "Swap loop next",
	},
	{
		"<leader>Sl",
		function()
			require("nvim-treesitter-textobjects.swap").swap_previous("@loop.outer")
		end,
		mode = "n",
		desc = "Swap loop previous",
	},

	{
		"<leader>si",
		function()
			require("nvim-treesitter-textobjects.swap").swap_next("@conditional.outer")
		end,
		mode = "n",
		desc = "Swap conditional next",
	},
	{
		"<leader>Si",
		function()
			require("nvim-treesitter-textobjects.swap").swap_previous("@conditional.outer")
		end,
		mode = "n",
		desc = "Swap conditional previous",
	},

	{
		"<leader>sp",
		function()
			require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
		end,
		mode = "n",
		desc = "Swap parameter next",
	},
	{
		"<leader>Sp",
		function()
			require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
		end,
		mode = "n",
		desc = "Swap parameter previous",
	},
}

return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,

		build = ":TSUpdate",
		cmd = { "TSInstall", "TSUpdate" },

		opts = treesitter_opts,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		lazy = false,

		cmd = { "TSInstall", "TSUpdate" },

		opts = treesitter_textobjects_opts,
		keys = treesitter_textobjects_keys,
	},
}
