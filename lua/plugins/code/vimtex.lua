local init = function()
	vim.g.vimtex_view_method = "zathura"
end

return {
	"lervag/vimtex",
	lazy = false,

	init = init,
}
