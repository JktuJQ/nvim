local opts = {
	signs = {
		{ name = "DapBreakpoint", text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" },
		{ name = "DapBreakpointCondition", text = "◉", texthl = "DapBreakpointCondition", linehl = "", numhl = "" },
		{ name = "DapLogPoint", text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" },
		{ name = "DapStopped", text = "→", texthl = "DapStopped", linehl = "", numhl = "" },
	},
}

local config = function()
	vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#e53935" })
	vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#e53935" })
	vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#81c784" })
	vim.api.nvim_set_hl(0, "DapStopped", { fg = "#e53935" })

	for _, sign in ipairs(opts.signs) do
		vim.fn.sign_define(sign.name, {
			text = sign.text,
			texthl = sign.texthl,
			linehl = sign.linehl,
			numhl = sign.numhl,
		})
	end
end

local keys = {
	{
		"<leader>dc",
		function()
			require("dap").continue()
		end,
		mode = "n",
		desc = "Start/continue",
	},
	{
		"<leader>ds",
		function()
			require("dap").step_over()
		end,
		mode = "n",
		desc = "Step over",
	},
	{
		"<leader>di",
		function()
			require("dap").step_into()
		end,
		mode = "n",
		desc = "Step into",
	},
	{
		"<leader>db",
		function()
			require("dap").toggle_breakpoint()
		end,
		mode = "n",
		desc = "Toggle breakpoint",
	},
	{
		"<leader>dB",
		function()
			require("dap").set_breakpoint(vim.fn.input("Condition: "))
		end,
		mode = "n",
		desc = "Conditional breakpoint",
	},
	{
		"<leader>dr",
		function()
			require("dap").repl.toggle()
		end,
		mode = "n",
		desc = "Toggle REPL",
	},
}

return {
	opts = opts,
	config = config,
	keys = keys,
}
