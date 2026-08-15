local plugins = {}

local function load_specs(dir, prefix)
	prefix = prefix or "plugins."
	local handle = vim.loop.fs_scandir(dir)
	if not handle then
		return
	end

	while true do
		local name, entry_type = vim.loop.fs_scandir_next(handle)
		if not name then
			break
		end
		local path = dir .. "/" .. name

		if entry_type == "directory" then
			load_specs(path, prefix .. name .. ".")
		elseif name:match("%.lua$") and name ~= "init.lua" then
			local spec = require(prefix .. name:gsub("%.lua$", ""))
			if type(spec) == "table" then
				vim.list_extend(plugins, type(spec[1]) == "table" and spec or { spec })
			end
		end
	end
end

local root = vim.fn.fnamemodify(debug.getinfo(1).source:sub(2), ":h")
load_specs(root)

return plugins
