local opts = {
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
		border = "rounded",
	},
	max_concurrent_installers = 4,
}

return {
	"williamboman/mason.nvim",

	cmd = "Mason",
	build = ":MasonUpdate",

	opts = opts,
}
