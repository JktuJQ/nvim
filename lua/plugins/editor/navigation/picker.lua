local opts = {
    enabled = true,
    matcher = {
        cwd_bonus = true,
        frecency = true,
    },
}

local keys = {
    -- find
    {
        "<leader>ff",
        function()
            Snacks.picker.files()
        end,
        mode = "n",
        desc = "Find files",
    },
    {
        "<leader>fb",
        function()
            Snacks.picker.buffers()
        end,
        mode = "n",
        desc = "Find buffers",
    },
    {
        "<leader>fr",
        function()
            Snacks.picker.recent()
        end,
        mode = "n",
        desc = "Find recent",
    },
    {
        "<leader>fp",
        function()
            Snacks.picker.projects()
        end,
        desc = "Projects",
    },

    -- grepping
    {
        "<leader>fg",
        function()
            Snacks.picker.grep()
        end,
        mode = "n",
        desc = "Find by grepping",
    },
    {
        "<leader>fw",
        function()
            Snacks.picker.grep_word()
        end,
        mode = "n",
        desc = "Find by grepping word under cursor",
    },
    {
        "<leader>fl",
        function()
            Snacks.picker.lines()
        end,
        mode = "n",
        desc = "Find lines",
    },

    -- lsp
    {
        "<leader>fd",
        function()
            Snacks.picker.lsp_definitions()
        end,
        mode = "n",
        desc = "Find definitions",
    },
    {
        "<leader>fD",
        function()
            Snacks.picker.lsp_declarations()
        end,
        mode = "n",
        desc = "Find declarations",
    },
    {
        "<leader>fi",
        function()
            Snacks.picker.lsp_implementations()
        end,
        mode = "n",
        desc = "Find implementations",
    },
    {
        "<leader>fu",
        function()
            Snacks.picker.lsp_references()
        end,
        mode = "n",
        desc = "Find usages",
    },
    {
        "<leader>ft",
        function()
            Snacks.picker.lsp_type_definitions()
        end,
        desc = "Find type definitions",
    },
    {
        "<leader>fs",
        function()
            Snacks.picker.lsp_symbols()
        end,
        mode = "n",
        desc = "Find document symbols",
    },
    {
        "<leader>fS",
        function()
            Snacks.picker.lsp_workspace_symbols()
        end,
        mode = "n",
        desc = "Find workspace symbols",
    },
    {
        "<leader>fe",
        function()
            Snacks.picker.diagnostics_buffer()
        end,
        desc = "Find errors in buffer (diagnostics)",
    },
    {
        "<leader>fE",
        function()
            Snacks.picker.diagnostics()
        end,
        desc = "Find errors (diagnostics)",
    },

    -- utils
    {
        "<leader>fc",
        function()
            Snacks.picker.colorschemes()
        end,
        desc = "Colorschemes",
    },
    {
        "<leader>fH",
        function()
            Snacks.picker.highlights()
        end,
        desc = "Find highlights",
    },
    {
        "<leader>fI",
        function()
            Snacks.picker.icons()
        end,
        desc = "Find icons",
    },
    {
        "<leader>fm",
        function()
            Snacks.picker.marks()
        end,
        desc = "Find marks",
    },
    {
        "<leader>fut",
        function()
            Snacks.picker.undo()
        end,
        desc = "Undo history",
    },
    {
        "<leader>f'",
        function()
            Snacks.picker.registers()
        end,
        desc = "Find registers",
    },
    {
        "<leader>f/",
        function()
            Snacks.picker.search_history()
        end,
        desc = "Find search history",
    },
    {
        "<leader>fa",
        function()
            Snacks.picker.autocmds()
        end,
        desc = "Find autocmds",
    },
    {
        "<leader>f:h",
        function()
            Snacks.picker.command_history()
        end,
        desc = "Find command history",
    },
    {
        "<leader>f:",
        function()
            Snacks.picker.commands()
        end,
        desc = "Find commands",
    },
    {
        "<leader>fj",
        function()
            Snacks.picker.jumps()
        end,
        desc = "Find jumps",
    },
    {
        "<leader>fk",
        function()
            Snacks.picker.keymaps()
        end,
        mode = "n",
        desc = "Find keymaps",
    },
    {
        "<leader>fH",
        function()
            Snacks.picker.help()
        end,
        desc = "Find help pages",
    },
    {
        "<leader>fM",
        function()
            Snacks.picker.man()
        end,
        desc = "Man Pages",
    },
    {
        "<leader>fL",
        function()
            Snacks.picker.loclist()
        end,
        desc = "Location List",
    },
    {
        "<leader>fQ",
        function()
            Snacks.picker.qflist()
        end,
        desc = "Quickfix List",
    },
    {
        "<leader>fP",
        function()
            Snacks.picker.lazy()
        end,
        desc = "Search for Plugin Spec",
    },
}

return {
    "folke/snacks.nvim",

    opts = { picker = opts },
    keys = keys,
}
