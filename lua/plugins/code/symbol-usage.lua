local opts = {
	vt_position = "end_of_line",
	references = { enabled = true, include_declaration = false },
	definition = { enabled = false },
	implementation = { enabled = false },
}

return {
	"Wansmer/symbol-usage.nvim",
	event = "LspAttach",

    opts = opts,
}
