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
		keymaps = {
			init_selection = "<C-space>",
			node_incremental = "<C-space>",
			node_decremental = "<bs>",
		},
	},
}

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	cmd = { "TSInstall", "TSUpdate" },

	opts = opts,
}
