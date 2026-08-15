local opts = {
	ensure_installed = {},
	automatic_installation = true,
}

local config = function()
	require("mason-nvim-dap").setup(opts)

	local dap = require("dap")
	dap.adapters.python = {
		type = "executable",
		command = "python",
		args = { "-m", "debugpy.adapter" },
	}
	dap.configurations.python = {
		{ type = "python", request = "launch", name = "Launch file", program = "${file}" },
	}
end

return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"nvim-neotest/nvim-nio",

		"mfussenegger/nvim-dap",
	},

	opts = opts,
	config = config,
}
