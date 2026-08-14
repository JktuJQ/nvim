local map = Snacks.keymap.set;

-- convenience remaps
map("i", "kk", "<esc>", { desc = "Mode changer" })

map("n", "<leader>yf", ":%y+<CR>")
map("n", "<leader>pf", ":%d | put + | 1d_<CR>")

-- typing
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- movement
local better_jk = function(letter)
    return ("v:count == 0 ? 'g%s' : '%s'"):format(letter, letter)
end
map({ "n", "x" }, "j", better_jk("j"), { desc = "Down", expr = true, silent = true, remap = true })
map({ "n", "x" }, "k", better_jk("k"), { desc = "Up", expr = true, silent = true, remap = true })

map({ "n", "x" }, "<up>", "3k", { desc = "Up 3 lines", remap = true })
map({ "n", "x" }, "<down>", "3j", { desc = "Down 3 lines", remap = true })
map({ "n", "x" }, "<left>", "3h", { desc = "Left 3 symbols", remap = true })
map({ "n", "x" }, "<right>", "3l", { desc = "Right 3 symbols", remap = true })

-- splits
map("n", "<C-h>", "<C-w>h", { desc = "Go to left split", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower split", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper split", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right split", remap = true })

map("n", "<C-up>", "<cmd>resize +2<cr>", { desc = "Increase split height", remap = true })
map("n", "<C-down>", "<cmd>resize -2<cr>", { desc = "Decrease split height", remap = true })
map("n", "<C-left>", "<cmd>vertical resize +2<cr>", { desc = "Increase split width", remap = true })
map("n", "<C-right>", "<cmd>vertical resize -2<cr>", { desc = "Decrease split width", remap = true })

map("n", "<C-->", "<C-w>s", { desc = "Split horizontally", remap = true })
map("n", "<C-\\>", "<C-w>v", { desc = "Split vertically", remap = true })
map("n", "<C-q>", "<C-w>c", { desc = "Close split", remap = true })

-- buffers
map("n", "<A-h>", "<cmd>bprevious<cr>", { desc = "Go to previous buffer" })
map("n", "<A-l>", "<cmd>bnext<cr>", { desc = "Go to previous buffer" })

map("n", "<A-b>", function() Snacks.bufdelete() end, { desc = "Delete buffer" })
map("n", "<A-b>do", function() Snacks.bufdelete.other() end, { desc = "Delete other buffers" })
map("n", "<A-b>di", function() Snacks.bufdelete.invisible() end, { desc = "Delete invisible buffers" })
map("n", "<A-b>D", "<cmd>bd<cr>", { desc = "Delete buffer and window" })

-- tabs
map("n", "<tab>f", "<cmd>tabfirst<cr>", { desc = "Go to first tab" })
map("n", "<tab>l", "<cmd>tablast<cr>", { desc = "Go to last tab" })
map("n", "<tab>h", "<cmd>tabprevious<cr>", { desc = "Go to previous tab" })
map("n", "<tab>l", "<cmd>tabnext<cr>", { desc = "Go to next tab" })

map("n", "<tab><tab>", "<cmd>tabnew<cr>", { desc = "New tab" })
map("n", "<tab>d", "<cmd>tabclose<cr>", { desc = "Close tab" })
map("n", "<tab>do", "<cmd>tabonly<cr>", { desc = "Close other tabs" })

-- selection
map("x", "<", "<gv")
map("x", ">", ">gv")

map("v", "J", ":m '>+1<CR>gv")
map("v", "K", ":m '<-2<CR>gv")
map("v", "H", "<gv")
map("v", "L", ">gv")

-- search
map({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")
  return "<esc>"
end, { expr = true, desc = "Escape and clear hlsearch" })

map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
map({ "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
map({ "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
