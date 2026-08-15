local opts = {
	formatters_by_ft = {
		lua = { "stylua" },
		nix = { "nixfmt" },
		python = { "black", "isort" },
		javascript = { { "prettierd", "prettier" } },
		go = { "goimports", "gofmt" },
		rust = { "rustfmt", lsp_format = "fallback" },
		c = { "clang_format" },
		cpp = { "clang_format" },
		sh = { "shfmt" },
		markdown = { "prettierd", "prettier" },
		json = { "prettierd", "prettier" },
		yaml = { "prettierd", "prettier" },
		["*"] = { "trim_whitespace" },
	},
	notify_on_error = true,
	formatters = {
		clang_format = {
			prepend_args = { "--style=file", "--fallback-style=LLVM" },
		},
		shfmt = {
			prepend_args = { "-i", "4" },
		},
	},
}

local keys = {
	{
		"<leader>cf",
		function()
			require("conform").format({ async = true, lsp_fallback = true })
		end,
		mode = "n",
		desc = "Format buffer",
	},
}

return {
	"stevearc/conform.nvim",

	event = { "BufReadPre", "BufNewFile" },
	cmd = { "ConformInfo" },

	opts = opts,
	keys = keys,
}
