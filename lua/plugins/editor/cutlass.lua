local opts = {
	cut_key = "c",
	override_del = false,
	exclude = {},
	registers = {
		select = "_",
		delete = "_",
		change = "_",
	},
}

return {
	"gbprod/cutlass.nvim",

	opts = opts,
}
