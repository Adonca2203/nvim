local util = require("formatter.util")
-- Formatter.nvim
require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		cs = {
			require("formatter.filetypes.cs").csharpier,
		},
	},
})
