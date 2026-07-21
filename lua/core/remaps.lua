-- basic remaps
Snacks.keymap.set("i", "kk", "<Esc>")
Snacks.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>")

Snacks.keymap.set("n", "<leader>yf", ":%y+<CR>")
Snacks.keymap.set("n", "<leader>pf", ":%d | put + | 1d_<CR>")

Snacks.keymap.set("n", "<leader>n", function()
	if vim.wo.relativenumber then
		vim.wo.relativenumber = false
		vim.wo.number = true
	else
		vim.wo.relativenumber = true
		vim.wo.number = true
	end
end, { desc = "Toggle relative/absolute line numbers" })

-- fast movement
Snacks.keymap.set("n", "<left>", "3h")
Snacks.keymap.set("n", "<down>", "3j")
Snacks.keymap.set("n", "<up>", "3k")
Snacks.keymap.set("n", "<right>", "3l")

Snacks.keymap.set("v", "<left>", "3h")
Snacks.keymap.set("v", "<down>", "3j")
Snacks.keymap.set("v", "<up>", "3k")
Snacks.keymap.set("v", "<right>", "3l")

-- selection
Snacks.keymap.set("v", "J", ":m '>+1<CR>gv")
Snacks.keymap.set("v", "K", ":m '<-2<CR>gv")
Snacks.keymap.set("v", "H", "<gv")
Snacks.keymap.set("v", "L", ">gv")

-- splits
Snacks.keymap.set("n", "<C-q>", ":q<CR>")

Snacks.keymap.set("n", "<C-h>", "<C-w>h")
Snacks.keymap.set("n", "<C-j>", "<C-w>j")
Snacks.keymap.set("n", "<C-k>", "<C-w>k")
Snacks.keymap.set("n", "<C-l>", "<C-w>l")

Snacks.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
Snacks.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
Snacks.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
Snacks.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")

Snacks.keymap.set("n", "<C-A-h>", "<C-w>v<C-w>h")
Snacks.keymap.set("n", "<C-A-j>", "<C-w>s<C-w>j")
Snacks.keymap.set("n", "<C-A-k>", "<C-w>s<C-w>k")
Snacks.keymap.set("n", "<C-A-l>", "<C-w>v<C-w>l")

Snacks.keymap.set("n", "<C-S-h>", ":vertical resize +5<CR>")
Snacks.keymap.set("n", "<C-S-j>", ":resize +5<CR>")
Snacks.keymap.set("n", "<C-S-k>", ":resize -5<CR>")
Snacks.keymap.set("n", "<C-S-l>", ":vertical resize -5<CR>")
