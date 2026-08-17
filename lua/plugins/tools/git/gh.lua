local opts = {
	enabled = true,
}

local keys = {
    {
        "<leader>gi",
        function()
            Snacks.picker.gh_issue()
        end,
        desc = "GitHub issues (open)",
    },
    {
        "<leader>gI",
        function()
            Snacks.picker.gh_issue({ state = "all" })
        end,
        desc = "GitHub issues (all)",
    },

    {
        "<leader>gp",
        function()
            Snacks.picker.gh_pr()
        end,
        desc = "GitHub pull requests (open)",
    },
    {
        "<leader>gP",
        function()
            Snacks.picker.gh_pr({ state = "all" })
        end,
        desc = "GitHub pull requests (all)",
    },
}

return {
	"folke/snacks.nvim",

	opts = { gh = opts },
	keys = keys,
}
