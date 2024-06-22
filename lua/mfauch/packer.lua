-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	-- Color Schemes
	use("navarasu/onedark.nvim")
	use("rebelot/kanagawa.nvim")

	-- TreeSitter
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	-- LSP
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ -- Optional
				"williamboman/mason.nvim",
				run = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
		-- Comment
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		}),
		-- Formatter
		use("mhartington/formatter.nvim"),

    -- Clipboard copy
    use {'ojroques/nvim-osc52'},

		use("jose-elias-alvarez/null-ls.nvim"),
		-- Tabline
		use({
			"kdheepak/tabline.nvim",
			config = function()
				require("tabline").setup({
					-- Defaults configuration options
					enable = true,
					options = {
						-- If lualine is installed tabline will use separators configured in lualine by default.
						-- These options can be used to override those settings.
						section_separators = { "", "" },
						component_separators = { "", "" },
						max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
						show_tabs_always = true, -- this shows tabs only when there are more than one tab or if the first tab is named
						show_devicons = true, -- this shows devicons in buffer section
						show_bufnr = false, -- this appends [bufnr] to buffer section,
						show_filename_only = true, -- shows base filename only instead of relative path in filename
						modified_icon = "x ", -- change the default modified icon
						modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
						show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
					},
				})
				vim.cmd([[
			set guioptions-=e " Use showtabline in gui vim
			set sessionoptions+=tabpages,globals " store tabpages and globals in session
			]])
			end,
			requires = { { "hoob3rt/lualine.nvim", opt = true }, { "kyazdani42/nvim-web-devicons", opt = true } },
		}),
		-- Lua statusline
		use("nvim-lualine/lualine.nvim"),
		-- Floating Terminal
		use("voldikss/vim-floaterm"),
		-- Autoclose pairs
		use("m4xshen/autoclose.nvim"),
		use({
			"prichrd/netrw.nvim",
			config = function()
				require("netrw").setup()
			end,
		}),
		use({
			"wiliamks/nice-reference.nvim",
			requires = {
				"kyazdani42/nvim-web-devicons",
				{
					"rmagatti/goto-preview",
					config = function()
						require("goto-preview").setup({
							width = 100,
							height = 25,
						})
					end,
				},
			},
			config = function()
				require("nice-reference").setup({
					anchor = "NW", -- Popup position anchor
					relative = "cursor", -- Popup relative position
					row = 1, -- Popup x position
					col = 0, -- Popup y position
					border = "rounded", -- Popup borderstyle
					winblend = 0, -- Popup transaparency 0-100, where 100 is transparent
					max_width = 120, -- Max width of the popup
					max_height = 10, -- Max height of the popup
					auto_choose = false, -- Go to reference if there is only one
				})
			end,
		}),
		-- Fugitive
		use("tpope/vim-fugitive"),
	})
end)
