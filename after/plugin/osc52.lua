require("osc52").setup({
	max_length = 0, -- Maximum length of selection (0 for no limit)
	silent = false, -- Disable message on successful copy
	trim = false, -- Trim surrounding whitespaces before copy
	tmux_passthrough = false, -- Use tmux passthrough (requires tmux: set -g allow-passthrough on)
})

vim.keymap.set("n", "<leader>yf", require("osc52").copy_operator, { expr = true })
vim.keymap.set("n", "<leader>yc", "<leader>yf_", { remap = true })
vim.keymap.set("v", "<leader>yc", require("osc52").copy_visual)
