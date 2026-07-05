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
	opts = opts,
	config = config,
}
