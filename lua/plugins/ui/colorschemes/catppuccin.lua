local opts = {
	flavour = "mocha",
	show_end_of_buffer = false,
	term_colors = true,
	no_italic = false,
	no_bold = false,
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = { "italic" },
		keywords = { "italic" },
		variables = {},
		types = { "bold" },
		functions = { "bold" },
		properties = {},
		numbers = { "bold" },
		strings = { "bold" },
		booleans = { "bold" },
		operators = { "bold" },
	},
	custom_highlights = function(_)
		return {
			["@keyword.function"] = { style = { "italic" } },
			["@keyword.return"] = { style = { "italic" } },
            ["@keyword.import"] = { link = "@keyword" },
			["@keyword.storage"] = { style = { "italic" } },
		}
	end,
	integrations = {
		bufferline = true,
		blink_cmp = true,
		lsp_trouble = true,
		mason = true,
		snacks = true,
		treesitter = true,
		which_key = true,
	},
}

local config = function()
	require("catppuccin").setup(opts)
	vim.cmd("colorscheme catppuccin")
end

return {
	"catppuccin/nvim",

	opts = opts,
	config = config,
}
