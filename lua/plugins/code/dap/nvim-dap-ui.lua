local opts = {
	layouts = {
		{
			elements = { "breakpoints", "watches" },
			position = "right",
			size = 30,
		},
		{
			elements = { "repl", "scopes" },
			position = "bottom",
			size = 10,
		},
	},
	floating = { border = "rounded" },
}

local config = function()
	require("dapui").setup(opts)
	local dap = require("dap")
	local dapui = require("dapui")
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end

local keys = {
	{
		"<leader>du",
		function()
			require("dapui").toggle()
		end,
		mode = "n",
		desc = "Toggle DAP UI",
	},
}

return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"nvim-neotest/nvim-nio",

		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},

	config = config,
	keys = keys,
}
