-- appearance
vim.opt.termguicolors = true
vim.g.have_nerd_fonts = true

-- windows/tabs/splits
vim.opt.fillchars = {
	vert = "█",
	horiz = "█",
	verthoriz = "█",
	vertleft = "█",
	vertright = "█",
	horizup = "█",
	horizdown = "█",
}

vim.api.nvim_set_hl(0, "WinSeparator", { bold = true })
vim.api.nvim_set_hl(0, "VertSplit", { bold = true })

-- lining
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8

vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#3b4261" })
vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#7aa2f7" })

-- tabs
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- searching
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250

-- utils
vim.g.mapleader = " "

vim.opt.mouse = "a"

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.undofile = true

vim.opt.timeoutlen = 300
