local opts = {}

local keys = {
	{
		"<leader>gD",
		"<cmd>DiffviewOpen HEAD<cr>",
		desc = "Git diff review (HEAD)",
	},
	{
		"<leader>gr",
		function()
			local root = Snacks.git.get_root() or Snacks.git.get_root(vim.fn.getcwd())
			if not root then
				vim.notify("Not inside a Git repository", vim.log.levels.WARN)
				return
			end

			local function git(args)
				local result = vim.system(vim.list_extend({ "git" }, args), { cwd = root, text = true }):wait()
				return result.code == 0 and result.stdout or nil
			end

			local output = git({
				"for-each-ref",
				"--sort=-committerdate",
				"--format=%(refname)\t%(symref)",
				"refs/heads",
				"refs/remotes",
			})
			if not output then
				vim.notify("Could not list Git branches", vim.log.levels.ERROR)
				return
			end

			local items, refs = {}, {}
			for _, line in ipairs(vim.split(output, "\n", { trimempty = true })) do
				local ref, symref = line:match("^(%S+)\t(.*)$")
				if ref and symref == "" then
					local remote = ref:match("^refs/remotes/") ~= nil
					local name = ref:gsub("^refs/heads/", ""):gsub("^refs/remotes/", "")
					local item = { ref = ref, name = name, text = name .. (remote and " [remote]" or " [local]") }
					items[#items + 1] = item
					refs[ref] = item
				end
			end
			if #items == 0 then
				vim.notify("No Git branches to review", vim.log.levels.WARN)
				return
			end

			local default = git({ "symbolic-ref", "--quiet", "refs/remotes/origin/HEAD" })
			local base = default and refs[vim.trim(default)]
			base = base or refs["refs/remotes/origin/main"] or refs["refs/remotes/origin/master"]

			local function open_diff(base_ref, branch_ref)
				vim.schedule(function()
					vim.api.nvim_cmd({
						cmd = "DiffviewOpen",
						args = { "-C=" .. root, base_ref .. "..." .. branch_ref },
					}, {})
				end)
			end

			local function choose_base(branch)
				vim.schedule(function()
					Snacks.picker({
						title = "Base for " .. branch.name,
						items = items,
						format = "text",
						confirm = function(picker, item)
							if item then
								picker:close()
								open_diff(item.ref, branch.ref)
							end
						end,
					})
				end)
			end

			local function review(picker, item, manual)
				if not item then
					return
				end
				picker:close()
				if base and not manual then
					open_diff(base.ref, item.ref)
				else
					choose_base(item)
				end
			end

			Snacks.picker({
				title = "Review branch (base: " .. (base and base.name or "choose manually") .. ")",
				items = items,
				format = "text",
				confirm = function(picker, item)
					review(picker, item, false)
				end,
				actions = {
					choose_base = function(picker, item)
						review(picker, item, true)
					end,
				},
				win = {
					input = {
						keys = {
							["<c-b>"] = { "choose_base", mode = { "n", "i" } },
						},
					},
					list = { keys = { ["<c-b>"] = "choose_base" } },
				},
			})
		end,
		desc = "Git branch review (diff view)",
	},
	{
		"<leader>gq",
		"<cmd>DiffviewClose<cr>",
		desc = "Close Git diff review",
	},
	{
		"<leader>gh",
		"<cmd>DiffviewFileHistory %<cr>",
		desc = "Git file history (diff view)",
	},
	{
		"<leader>gH",
		"<cmd>DiffviewFileHistory<cr>",
		desc = "Git history (diff view)",
	},
}

return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = {
		"DiffviewOpen",
		"DiffviewClose",
		"DiffviewFileHistory",
		"DiffviewToggleFiles",
		"DiffviewFocusFiles",
		"DiffviewRefresh",
	},

	opts = opts,
	keys = keys,
}
