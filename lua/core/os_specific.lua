local detect_os = function()
	if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
		return "windows"
	elseif vim.fn.has("mac") == 1 or vim.fn.has("macunix") == 1 then
		return "mac"
	elseif vim.fn.has("linux") == 1 then
		return "linux"
	else
		return "unknown"
	end
end

local os = detect_os()

local setup_clipboard = function()
	if os == "windows" then
		local win32yank_path = vim.fn.executable("win32yank.exe")
		if win32yank_path == 1 then
			vim.g.clipboard = {
				name = "win32yank",
				copy = {
					["+"] = "win32yank.exe -i --crlf",
					["*"] = "win32yank.exe -i --crlf",
				},
				paste = {
					["+"] = "win32yank.exe -o --lf",
					["*"] = "win32yank.exe -o --lf",
				},
				cache_enabled = true,
			}
		else
			vim.g.clipboard = {
				name = "WindowsClipboard",
				copy = {
					["+"] = 'powershell.exe -command "Get-Clipboard | Set-Clipboard"',
					["*"] = 'powershell.exe -command "Get-Clipboard | Set-Clipboard"',
				},
				paste = {
					["+"] = 'powershell.exe -command "Get-Clipboard"',
					["*"] = 'powershell.exe -command "Get-Clipboard"',
				},
				cache_enabled = true,
			}
		end
	elseif os == "mac" then
		vim.g.clipboard = {
			name = "macOSClipboard",
			copy = {
				["+"] = "pbcopy",
				["*"] = "pbcopy",
			},
			paste = {
				["+"] = "pbpaste",
				["*"] = "pbpaste",
			},
			cache_enabled = true,
		}
	elseif os == "linux" then
		local has_wl_clipboard = vim.fn.executable("wl-copy") == 1 and vim.fn.executable("wl-paste") == 1
		local has_xclip = vim.fn.executable("xclip") == 1
		local has_xsel = vim.fn.executable("xsel") == 1
		local is_wayland = vim.env.WAYLAND_DISPLAY ~= nil

		if has_wl_clipboard and (is_wayland or not has_xclip) then
			vim.g.clipboard = {
				name = "wl-clipboard",
				copy = {
					["+"] = "wl-copy",
					["*"] = "wl-copy --primary",
				},
				paste = {
					["+"] = "wl-paste --no-newline",
					["*"] = "wl-paste --primary --no-newline",
				},
				cache_enabled = true,
			}
		elseif has_xclip then
			vim.g.clipboard = {
				name = "xclip",
				copy = {
					["+"] = "xclip -selection clipboard -i",
					["*"] = "xclip -selection primary -i",
				},
				paste = {
					["+"] = "xclip -selection clipboard -o",
					["*"] = "xclip -selection primary -o",
				},
				cache_enabled = true,
			}
		elseif has_xsel then
			vim.g.clipboard = {
				name = "xsel",
				copy = {
					["+"] = "xsel --clipboard --input",
					["*"] = "xsel --primary --input",
				},
				paste = {
					["+"] = "xsel --clipboard --output",
					["*"] = "xsel --primary --output",
				},
				cache_enabled = true,
			}
		else
			vim.g.clipboard = {
				name = "OSC52",
				copy = {
					["+"] = require("vim.ui.clipboard.osc52").copy("+"),
					["*"] = require("vim.ui.clipboard.osc52").copy("*"),
				},
				paste = {
					["+"] = require("vim.ui.clipboard.osc52").paste("+"),
					["*"] = require("vim.ui.clipboard.osc52").paste("*"),
				},
			}
		end
	end

	vim.opt.clipboard = "unnamedplus"
end

return {
	os = os,
	setup_clipboard = setup_clipboard,
}
