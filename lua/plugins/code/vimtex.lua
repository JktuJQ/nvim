local init = function()
	vim.g.vimtex_view_method = "zathura"
end

-- <localleader>ll  - compile
-- <localleader>lv  - view
-- <localleader>lX  - reload

return {
	"lervag/vimtex",
    tag = "v2.17",
	lazy = false,

	init = init,
}
