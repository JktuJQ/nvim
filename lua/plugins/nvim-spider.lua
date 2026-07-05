local opts = {
	skipInsignificantPunctuation = false,
}

local keys = {
	{
		"w",
		function()
			require("spider").motion("w")
		end,
		mode = { "n", "o", "x" },
		desc = "Spider-w (subword motion)",
	},
	{
		"e",
		function()
			require("spider").motion("e")
		end,
		mode = { "n", "o", "x" },
		desc = "Spider-e (subword motion)",
	},
	{
		"b",
		function()
			require("spider").motion("b")
		end,
		mode = { "n", "o", "x" },
		desc = "Spider-b (subword motion)",
	},
	{
		"ge",
		function()
			require("spider").motion("ge")
		end,
		mode = { "n", "o", "x" },
		desc = "Spider-ge (subword motion)",
	},
}

return {
	"chrisgrieser/nvim-spider",

	opts = opts,
	keys = keys,
}
