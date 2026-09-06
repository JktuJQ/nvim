local opts = {
	options = {
		theme = "catppuccin-nvim",
		globalstatus = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "NvimTree", "neo-tree", "Trouble", "lazy", "mason", "oil" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			{
				function()
					local filename = vim.fn.expand("%:t")
					local ft = vim.bo.filetype
					if filename ~= "" and ft ~= "" then
						return filename .. " (" .. ft .. ")"
					elseif filename ~= "" then
						return filename
					elseif ft ~= "" then
						return "(" .. ft .. ")"
					else
						return ""
					end
				end,
				padding = { left = 1, right = 1 },
			},
		},
		lualine_x = {
			{
				function()
					local parts = {}
					local ft = vim.bo.filetype

					local clients = vim.lsp.get_clients({ bufnr = 0 })
					if #clients > 0 then
						local names = {}
						for _, client in ipairs(clients) do
							table.insert(names, client.name)
						end
						table.insert(parts, " " .. table.concat(names, ", "))
					else
						table.insert(parts, "No LSP")
					end

					local has_dap, dap = pcall(require, "dap")
					if has_dap and dap.session() then
						table.insert(parts, "󰑈 DAP")
					end

					local has_conform, conform = pcall(require, "conform")
					if has_conform and ft and ft ~= "" then
						local formatters = conform.list_formatters_for_buffer()
						if formatters and #formatters > 0 then
							local first_formatter = nil
							for _, f in ipairs(formatters) do
								if f ~= "trim_whitespace" then
									first_formatter = f
									break
								end
							end
							if first_formatter then
								table.insert(parts, "󰛨 " .. first_formatter)
							end
						end
					end

					return table.concat(parts, " + ")
				end,
				padding = { left = 1, right = 1 },
			},
			"encoding",
			"fileformat",
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	extensions = { "lazy", "mason", "nvim-tree", "trouble", "oil" },
}

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	event = "VimEnter",

	opts = opts,
}
