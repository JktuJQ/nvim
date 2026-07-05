local lua_ls = {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = {
				globals = { "vim" },
				disable = { "undefined-global" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
				maxPreload = 100000,
				preloadFileSize = 1000,
			},
			telemetry = { enable = false },
			format = { enable = true },
			hint = { enable = true },
		},
	},
}
local nil_ls = {
	settings = {
		["nil"] = {
			formatting = {
				command = { "nixfmt" },
			},
			diagnostics = {
				ignored = { "unused_binding", "unused_with" },
			},
		},
	},
}
local pyright = {
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
				typeCheckingMode = "basic",
				indexing = true,
			},
		},
	},
}
local clangd = {
	capabilities = {
		offsetEncoding = "utf-8",
	},
	settings = {
		clangd = {
			inlayHints = {
				enabled = true,
				parameterNames = true,
				deducedTypes = true,
			},
		},
	},
}
local rust_analyzer = {
	settings = {
		["rust-analyzer"] = {
			cargo = {
				loadOutDirsFromCheck = true,
			},
			procMacro = { enable = true },
			checkOnSave = true,
			diagnostics = {
				enable = true,
			},
			inlayHints = {
				bindingModeHints = true,
				closureReturnTypeHints = true,
				lifetimeElisionHints = "always",
				parameterHints = true,
				reborrowHints = "always",
			},
		},
	},
}
local servers = {
	lua_ls = lua_ls,
	nil_ls = nil_ls,
	pyright = pyright,
	clangd = clangd,
	rust_analyzer = rust_analyzer,
}

local opts = {
	ensure_installed = {
		-- "lua_ls",
		-- "nil_ls",
		-- "pyright",
		-- "clangd",
		-- "rust_analyzer",
		-- "hls",
	},
}

local config = function()
	require("mason-lspconfig").setup(opts)

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	local has_blink, blink = pcall(require, "blink.cmp")
	if has_blink then
		capabilities = blink.get_lsp_capabilities(capabilities)
	end

	for server_name, server_config in pairs(servers) do
		vim.lsp.config(server_name, {
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end
			end,
			settings = server_config.settings or {},
		})
	end

	vim.lsp.enable(vim.tbl_keys(servers))
end

return {
	opts = opts,
	config = config,
}
