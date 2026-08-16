local opt = vim.opt

-- leader
vim.g.mapleader = " "
vim.g.localmapleader = "\\"

-- appearance
opt.termguicolors = true
vim.g.have_nerd_fonts = true
vim.o.winborder = "rounded"
opt.conceallevel = 2
opt.laststatus = 3
opt.showmode = false
opt.ruler = false
opt.cursorline = true
opt.signcolumn = "yes"
opt.pumblend = 10
opt.pumheight = 10
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

-- line numbers
opt.number = true
opt.relativenumber = true
opt.scrolloff = 8
opt.sidescrolloff = 8

-- tabs and indentation
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.shiftround = true

-- searching
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "nosplit"
opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"

-- splits
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"
opt.winminwidth = 5
opt.virtualedit = "block"

-- files and backups
opt.autowrite = true
opt.confirm = true
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undolevels = 10000
opt.writebackup = false

-- timeouts
opt.timeoutlen = 300
opt.updatetime = 200
opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- command line and completion
opt.wildmode = "longest:full,full"
opt.completeopt = "menu,menuone,noselect"

-- mouse and cursor
opt.mouse = "a"
opt.jumpoptions = "view"

-- text
opt.wrap = false
opt.linebreak = true
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.formatoptions = "jcroqlnt"

opt.foldmethod = "indent"
opt.foldlevel = 99
opt.foldtext = ""

-- misc
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.spelllang = { "en" }
opt.smoothscroll = true
