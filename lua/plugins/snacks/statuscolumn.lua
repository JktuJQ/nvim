local opts = {
	enabled = true,
	left = { "mark", "sign" },
	right = { "fold", "git" },
	folds = {
		open = false,
		git_hl = false,
	},
	refresh = 50,
}

return {
	opts = opts,
}
