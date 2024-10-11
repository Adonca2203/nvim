function SetColorScheme(color)
	color = color or "kanagawa"
	vim.cmd.colorscheme(color)

	-- For Transparent backgrounds
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

SetColorScheme("catppuccin-mocha")
