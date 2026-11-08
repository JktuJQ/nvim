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
local basedpyright = {
	settings = {
		basedpyright = {
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
local jdtls = {
	-- Isolate each project by its full path, including checkouts with the same name.
	cmd = function(dispatchers, config)
		local root = vim.fs.normalize(config.root_dir or vim.fn.getcwd())
		local project = vim.fn.fnamemodify(root, ":t") .. "-" .. vim.fn.sha256(root):sub(1, 12)
		local data_dir = vim.fs.joinpath(vim.fn.stdpath("cache"), "jdtls", "projects", project)
		local cmd = { "jdtls", "-data", data_dir }
		-- Keep the actual command available to nvim-jdtls maintenance commands.
		config.cmd = cmd
		return vim.lsp.rpc.start(cmd, dispatchers, {
			cwd = root,
			env = config.cmd_env,
			detached = config.detached,
		})
	end,
	init_options = {
		extendedClientCapabilities = { classFileContentsSupport = true },
	},
	-- JDT LS starts importing during initialize; send settings before that import.
	before_init = function(params, config)
		params.initializationOptions = vim.tbl_deep_extend("force", params.initializationOptions or {}, {
			settings = config.settings,
		})
	end,
	settings = {
		java = {
			jdt = { ls = { androidSupport = { enabled = true } } },
			configuration = { updateBuildConfiguration = "automatic" },
			import = {
				gradle = { enabled = true, wrapper = { enabled = true } },
				maven = { enabled = true },
			},
			eclipse = { downloadSources = true },
			maven = { downloadSources = true },
			signatureHelp = { enabled = true },
			inlayHints = { parameterNames = { enabled = "literals" } },
			format = { enabled = true },
			completion = {
				importOrder = { "java", "javax", "org", "com" },
			},
		},
	},
}
local kotlin_lsp = {
	workspace_required = true,
	root_markers = {
		"settings.gradle",
		"settings.gradle.kts",
		"pom.xml",
		"build.gradle",
		"build.gradle.kts",
		"workspace.json",
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
local hls = {
	settings = {
		haskell = {
			formattingProvider = "ormolu",
			plugin = {
				hlint = { enable = true },
			},
		},
	},
}
local texlab = {
	settings = {
		texlab = {
			build = {
				executable = "latexmk",
				args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
				onSave = true,
			},
			forwardSearch = {
				executable = "zathura",
				args = { "--synctex-forward", "%l:1:%f", "%p" },
			},
			chktex = {
				onOpenAndSave = true,
			},
		},
	},
}
local servers = {
	lua_ls = lua_ls,
	nil_ls = nil_ls,
	basedpyright = basedpyright,
	clangd = clangd,
	jdtls = jdtls,
	kotlin_lsp = kotlin_lsp,
	rust_analyzer = rust_analyzer,
	hls = hls,
	texlab = texlab,
}

local opts = {
	ensure_installed = {
		-- "lua_ls",
		-- "nil_ls",
		-- "basedpyright",
		-- "clangd",
		-- "rust_analyzer",
		-- "hls",
		-- "texlab",
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
		local merged_config = vim.tbl_deep_extend("force", {
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end
			end,
		}, server_config)
		vim.lsp.config(server_name, merged_config)
	end

	vim.lsp.enable(vim.tbl_keys(servers))
end

return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},

	opts = opts,
	config = config,
}
