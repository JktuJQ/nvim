local opts = {
    flavour = "mocha",
    transparent_background = true,
    show_end_of_buffer = false,
    term_colors = true,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false,
    no_bold = false,
    styles = {
        comments = { italic = (vim.fn.has("gui_running") and true or false) },
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
    },
    integrations = {
        blink_cmp = true,
        lsp_trouble = true,
        mason = true,
        snacks = true,
        treesitter = true,
        which_key = true,
    },
}

local config = function()
    vim.cmd("colorscheme catppuccin")
end

return {
    "catppuccin/nvim",
    name="catppuccin",
    priority = 1000,

    opts = opts,
    config = config,
}
