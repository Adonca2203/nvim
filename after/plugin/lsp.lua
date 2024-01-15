local lsp = require("lsp-zero")
lsp.extend_lspconfig()

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"eslint",
		"lua_ls",
		"pylsp",
		"prettier",
	},
	handlers = {
		lsp.default_setup,
		lua_ls = function()
			local lua_opts = lsp.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
	},
})

-- Config lsp
require("lspconfig").pylsp.setup({
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "W391", "E501" },
					maxLineLength = 100,
				},
			},
		},
	},
})
require("lspconfig").lua_ls.setup({})
require("lspconfig").csharp_ls.setup({})

local cmp = require("cmp")
cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	},
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
	-- Format the file & save
	vim.keymap.set("n", "<leader>fmt", function()
		vim.lsp.buf.format({
			formatting_options = {
				tabSize = 2,
				insertSpaces = true,
				trimTrailingWhitespace = true,
			},
		})
		vim.cmd(":w")
	end, opts)
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})
