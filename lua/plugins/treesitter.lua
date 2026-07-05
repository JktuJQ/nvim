local opts = {
	ensure_installed = {
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
	},
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-space>",
			node_incremental = "<C-space>",
			scope_incremental = false,
			node_decremental = "<bs>",
		},
	},
	indent = {
		enable = true,
	},
	playground = {
		enable = true,
	},
}

local config = function()
	vim.api.nvim_create_autocmd("ColorScheme", {
		callback = function()
			vim.treesitter.start()
		end,
	})
end

return {
	"nvim-treesitter/nvim-treesitter",

	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },

	opts = opts,
	config = config,
}
