local lua = {
	adapter = {
		type = "executable",
		command = "node",
		args = {
			vim.fs.joinpath(vim.fn.stdpath("data"), "mason/share/local-lua-debugger-vscode/extension/debugAdapter.js"),
		},
	},
	configurations = {
		{
			type = "lua",
			request = "attach",
			name = "Attach to running process",
			connect = { host = "127.0.0.1", port = 4711 },
		},
		{
			type = "lua",
			request = "launch",
			name = "Launch file",
			program = "${file}",
		},
	},
}
local python = {
	adapter = {
		type = "executable",
		command = "python",
		args = { "-m", "debugpy.adapter" },
	},
	configurations = {
		{
			type = "python",
			request = "launch",
			name = "Launch file",
			program = "${file}",
		},
		{
			type = "python",
			request = "launch",
			name = "Launch with args",
			program = "${file}",
			args = function()
				local args = vim.fn.input("Arguments: ")
				return vim.split(args, " ")
			end,
		},
	},
}
local c = {
	adapter = {
		type = "server",
		command = "codelldb",
		args = { "--port", "${port}" },
	},
	configurations = {
		{
			name = "Launch file",
			type = "codelldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
		},
	},
}
local cpp = {
	adapter = {
		type = "server",
		command = "codelldb",
		args = { "--port", "${port}" },
	},
	configurations = {
		{
			name = "Launch file",
			type = "codelldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
		},
	},
}
local rust = {
	adapter = {
		type = "executable",
		command = "codelldb",
		args = { "--port", "${port}" },
	},
	configurations = {
		{
			name = "Launch file",
			type = "codelldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
		},
	},
}
local debuggers = {
	lua = lua,
	python = python,
	c = c,
	cpp = cpp,
	rust = rust,
}

local opts = {
	ensure_installed = {
		-- "lua-local-debugger",
		-- "python",
		-- "codelldb",
	},
	automatic_installation = true,
}

local config = function()
	require("mason-nvim-dap").setup(opts)

	local dap = require("dap")
	for name, conf in pairs(debuggers) do
		if conf.adapter then
			dap.adapters[name] = conf.adapter
		end
		if conf.configurations then
			dap.configurations[name] = conf.configurations
		end
	end
end

return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"nvim-neotest/nvim-nio",

		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},

	config = config,
}
