local nvim_dap = require("plugins.dap.nvim-dap")
local mason_nvim_dap = require("plugins.dap.mason-nvim-dap")
local nvim_dap_ui = require("plugins.dap.nvim-dap-ui")

return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"williamboman/mason.nvim",
			"nvim-neotest/nvim-nio",
		},

		opts = nvim_dap.opts,
		config = nvim_dap.config,
		keys = nvim_dap.keys,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"nvim-neotest/nvim-nio",
			"mfussenegger/nvim-dap",
		},

		opts = mason_nvim_dap.opts,
		config = mason_nvim_dap.config,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"williamboman/mason.nvim",
			"nvim-neotest/nvim-nio",
			"mfussenegger/nvim-dap",
		},

		opts = nvim_dap_ui.opts,
		config = nvim_dap_ui.config,
	},
}
