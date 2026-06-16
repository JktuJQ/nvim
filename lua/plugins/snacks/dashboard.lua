local function git_status()
    local root = vim.fn.system({ "git", "rev-parse", "--show-toplevel" }):gsub("\n", "")
    local git_output = ""

    if root ~= "" and vim.v.shell_error == 0 then
        local branch = vim.fn.system({ "git", "-C", root, "branch", "--show-current" }):gsub("\n", "")
        local diff = vim.fn.system({ "git", "-C", root, "--no-pager", "diff", "--stat", "-B", "-M", "-C" })

        local full_output = ""
        if branch == "" and diff == "" then
            full_output = "No git changes"
        elseif branch ~= "" and diff == "" then
            full_output = "On branch: " .. branch .. "\n\nNo git changes"
        elseif branch ~= "" and diff ~= "" then
            full_output = "On branch: " .. branch .. "\n" .. diff
        else
            full_output = diff
        end

        local lines = {}
        for line in full_output:gmatch("[^\r\n]+") do
            table.insert(lines, line)
        end

        local max_lines = 10
        if #lines > max_lines then
            local truncated_count = #lines - max_lines
            for i = 1, max_lines - 1 do
                git_output = git_output .. lines[i] .. "\n"
            end
            git_output = git_output .. "... and " .. truncated_count .. " more lines truncated"
        else
            git_output = full_output
        end
    else
        git_output = "Not in a git repository"
    end
    return git_output
end

local opts = {
    preset = {
        keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "m", desc = "Filetree", action = ":lua Snacks.explorer()" },
            { icon = "󰒓 ", key = "c", desc = "Config", action = ":lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })" },
            { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
        },
    },
    sections = {
        { section = "header" },
        {
            pane = 2,
            section = "terminal",
            cmd = "colorscript -e square",
            height = 5,
            padding = 1,
        },
        { section = "keys", gap = 1, padding = 1 },
        {
            pane = 2,
            icon = "󰈞 ",
            title = "Recent Files",
            section = "recent_files",
            limit = 6,
            indent = 2,
            padding = 1,
            action = function(item)
                Snacks.explorer(item.file)
            end,
        },
        {
            pane = 2,
            icon = "󰉋 ",
            title = "Projects",
            section = "projects",
            limit = 4,
            indent = 2,
            padding = 1,
            action = function(item)
                Snacks.explorer(item.file)
            end,
        },
        { pane = 2, gap = 5 },
        {
            pane = 2,
            icon = "󰊢 ",
            desc = "Browse Repo",
            padding = 1,
            key = "b",
            action = function()
                Snacks.gitbrowse()
            end,
        },
        {
            pane = 2,
            icon = " ",
            title = "Git Status\n",
            desc = git_status(),
            height = 10,
            padding = 1,
        },
        { section = "startup" },
    },
}

return {
    opts = opts,
}
