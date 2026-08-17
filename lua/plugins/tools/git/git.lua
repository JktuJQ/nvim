local opts = {
	enabled = true,
}

local keys = {
    {
        "<leader>gb",
        function()
            Snacks.picker.git_branches()
        end,
        desc = "Git branches",
    },
    {
        "<leader>gl",
        function()
            Snacks.picker.git_log_file()
        end,
        desc = "Git log of file",
    },
    {
        "<leader>gll",
        function()
            Snacks.picker.git_log_line()
        end,
        desc = "Git log of file line",
    },
    {
        "<leader>gL",
        function()
            Snacks.picker.git_log()
        end,
        desc = "Git log",
    },
    {
        "<leader>gs",
        function()
            Snacks.picker.git_status()
        end,
        desc = "Git status",
    },
    {
        "<leader>gS",
        function()
            Snacks.picker.git_stash()
        end,
        desc = "Git stash",
    },
    {
        "<leader>gd",
        function()
            Snacks.picker.git_diff()
        end,
        desc = "Git diff (hunks)",
    },
}

return {
	"folke/snacks.nvim",

	opts = { git = opts },
    keys = keys,
}
