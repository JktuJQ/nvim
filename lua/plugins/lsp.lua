local mason_lspconfig = require("plugins.lsp.mason-lspconfig")
local nvim_lspconfig = require("plugins.lsp.nvim-lspconfig")

return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },

		opts = mason_lspconfig.opts,
		config = mason_lspconfig.config,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},

		lazy = false,

		config = nvim_lspconfig.config,
		keys = nvim_lspconfig.keys,
	},
}
