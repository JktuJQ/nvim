local init = function()
	vim.g.suda_smart_edit = 1
end

return {
	"lambdalisue/vim-suda",
    lazy = false,

	cmd = { "SudaRead", "SudaWrite" },

	init = init,
	keys = keys,
}
