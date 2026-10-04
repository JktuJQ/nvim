local init = function()
	local function escape(str)
		return vim.fn.escape(str, [[;,."|\]])
	end

	local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm,.]]
	local ru = [[ёйцукенгшщзхъфывапролджэячсмитьбю]]
	local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>#]]
	local ru_shift = [[ЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ№]]
	vim.opt.langmap = vim.fn.join({
		escape(ru_shift) .. ";" .. escape(en_shift),
		escape(ru) .. ";" .. escape(en),
	}, ",")
	vim.opt.langremap = false
end

local opts = {
	map_all_ctrl = false,
	disable_hack_modes = { "i", "c" },
	automapping_modes = { "n", "v", "x", "s" },
	layouts = {
		ru = {
			default_layout = [=[`qwertyuiop[]asdfghjkl;'zxcvbnm,.~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>#]=],
			layout = [=[ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ№]=],
		},
	},
}

local config = function()
	local langmapper = require("langmapper")
	langmapper.setup(opts)
	langmapper.map("i", "kk", "<esc>", { desc = "Go to normal mode" })

	local layout = opts.layouts.ru
	local english = vim.fn.split(layout.default_layout, "\\zs")
	for index, russian in ipairs(vim.fn.split(layout.layout, "\\zs")) do
		local translated = english[index]
		vim.keymap.set("c", russian, function()
			return vim.fn.getcmdtype() == ":" and translated or russian
		end, { expr = true, desc = "English input in Ex commands" })
	end

	vim.schedule(function()
		langmapper.automapping({ global = true, buffer = false })
	end)
end

return {
	"Wansmer/langmapper.nvim",
	lazy = false,
	priority = 10000,
	init = init,
	opts = opts,
	config = config,
}
