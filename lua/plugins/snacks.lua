local function get_snacks_modules()
	local modules = {}
	local snacks_dir = vim.fn.expand("<sfile>:p:h") .. "/lua/plugins/snacks"
	local pattern = snacks_dir .. "/*.lua"
	local files = vim.fn.glob(pattern, false, true)

	for _, filepath in ipairs(files) do
		local name = vim.fn.fnamemodify(filepath, ":t:r")
		local ok, module = pcall(require, "plugins.snacks." .. name)
		if ok and module then
			modules[name] = module
		end
	end
	return modules
end
local modules = get_snacks_modules()

local opts = {}
for name, module in pairs(modules) do
	if module.opts then
		opts[name] = module.opts
	end
end

local config = function()
	require("snacks").setup(opts)
	for _, module in pairs(modules) do
		if module.config then
			module.config()
		end
	end
end

local keys = {}
for _, module in pairs(modules) do
	if module.keys and type(module.keys) == "table" then
		vim.list_extend(keys, module.keys)
	end
end

return {
	"folke/snacks.nvim",

	lazy = false,
	priority = 10000,

	opts = opts,
	config = config,
	keys = keys,
}
