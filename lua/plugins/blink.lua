local opts = {
	snippets = { preset = "luasnip" },
	keymap = {
		preset = "default",
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },
		["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-e>"] = { "hide", "fallback" },
		["<CR>"] = { "accept", "fallback" },
		["<Tab>"] = {
			function(cmp)
				if require("luasnip").expand_or_jumpable() then
					return require("luasnip").expand_or_jump()
				elseif cmp.is_visible() then
					return cmp.select_next()
				end
				return false
			end,
			"snippet_forward",
			"fallback",
		},
		["<S-Tab>"] = {
			function(cmp)
				if require("luasnip").jumpable(-1) then
					return require("luasnip").jump(-1)
				elseif cmp.is_visible() then
					return cmp.select_prev()
				end
				return false
			end,
			"snippet_backward",
			"fallback",
		},
	},
	appearance = {
		nerd_font_variant = "mono",
		kind_icons = {
			Text = "󰉿",
			Method = "󰆧",
			Function = "󰊕",
			Constructor = "",
			Field = "󰜢",
			Variable = "󰀫",
			Class = "󰠱",
			Interface = "",
			Module = "",
			Property = "󰜢",
			Unit = "󰑭",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈙",
			Reference = "󰈇",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "󰙅",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "󰅲",
			Copilot = "",
		},
	},
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
			window = {
				border = "rounded",
			},
		},
		menu = {
			border = "rounded",
			draw = {
				columns = {
					{ "label", "label_description", gap = 1 },
					{ "kind_icon", "kind", gap = 1 },
				},
				components = {
					kind_icon = {
						width = { fixed = 2 },
						text = function(ctx)
							return ctx.kind_icon
						end,
					},
					kind = {
						width = { fixed = 4 },
						text = function(ctx)
							return ctx.kind
						end,
					},
					label = { width = { fill = true } },
					label_description = {
						width = { fill = true },
						text = function(ctx)
							return ctx.label_description
						end,
					},
				},
			},
		},
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		providers = {
			lsp = {
				name = "LSP",
				module = "blink.cmp.sources.lsp",
				score_offset = 100,
				async = true,
			},
			path = {
				name = "Path",
				module = "blink.cmp.sources.path",
				score_offset = 50,
				opts = {
					trailing_slash = true,
					show_hidden_files_by_default = false,
				},
			},
			snippets = {
				name = "Snippets",
				module = "blink.cmp.sources.snippets",
				score_offset = 80,
				opts = {
					friendly_snippets = true,
				},
			},
			buffer = {
				name = "Buffer",
				module = "blink.cmp.sources.buffer",
				score_offset = 20,
				opts = {
					max_items = 5,
					min_keyword_length = 3,
					same_filetype = true,
				},
			},
		},
	},
	signature = {
		enabled = true,
		window = {
			border = "rounded",
		},
	},
}

return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"L3MON4D3/LuaSnip",
		},
		version = "1.*",
		build = "cargo build --release",

		opts = opts,
	},
}
