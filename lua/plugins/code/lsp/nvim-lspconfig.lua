local augroup = vim.api.nvim_create_augroup("UserLspConfig", { clear = true })

local on_attach = function(client, bufnr)
	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end
end

local config = function()
	vim.diagnostic.config({
		virtual_text = {
			prefix = "●",
			spacing = 4,
			source = true,
		},
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "󰅚 ",
				[vim.diagnostic.severity.WARN] = "󰀪 ",
				[vim.diagnostic.severity.INFO] = "󰋽 ",
				[vim.diagnostic.severity.HINT] = "󰌶 ",
			},
		},
		underline = true,
		update_in_insert = false,
		severity_sort = true,
		float = {
			border = "rounded",
			source = true,
		},
	})

	vim.api.nvim_create_autocmd("LspAttach", {
		group = augroup,
		callback = function(args)
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			if client then
				on_attach(client, args.buf)
			end
		end,
	})
end

local keys = {
	{
		"<leader>li",
		function()
			vim.cmd("checkhealth vim.lsp")
		end,
		mode = "n",
		desc = "LSP Info",
	},
	{
		"<leader>lr",
		function()
			vim.cmd("lsp restart")
		end,
		mode = "n",
		desc = "Restart LSP",
	},
	{
		"<leader>ll",
		function()
			local state_path = vim.fn.stdpath("state")
			local log_path = vim.fs.joinpath(state_path, "lsp.log")
			vim.cmd(string.format("split %s", log_path))
		end,
		mode = "n",
		desc = "Open LSP log",
	},
	{
		"<leader>le",
		function()
			vim.diagnostic.open_float()
		end,
		mode = "n",
		desc = "Show line diagnostics",
	},
	{
		"H",
		vim.lsp.buf.hover,
		mode = "n",
		desc = "Hover documentation",
	},
	{
		"<leader>rn",
		vim.lsp.buf.rename,
		mode = "n",
		desc = "Rename symbol",
	},
	{
		"<leader>ca",
		vim.lsp.buf.code_action,
		mode = "n",
		desc = "Code action",
	},
	{
		"<leader>f",
		function()
			vim.lsp.buf.format({ async = true })
		end,
		mode = "n",
		desc = "Format document",
	},
}

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},

	lazy = false,

	config = config,
	keys = keys,
}
