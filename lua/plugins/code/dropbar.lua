local opts = {
    icons = {
        ui = {
            bar = {
                separator = " ❯ ",
            },
        },
    },
}

local keys = {
    {
        "<leader>ls",
        function()
            require("dropbar.api").pick()
        end,
        mode = "n",
        desc = "Pick symbols in winbar",
    },
}

return {
    "Bekaboo/dropbar.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    event = "VeryLazy",

    opts = opts,
    keys = keys,
}
