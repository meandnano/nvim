return {
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme catppuccin-mocha")
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			vim.cmd(":TSUpdate")
		end
	},
	"folke/trouble.nvim",
	"mbbill/undotree",
	"tpope/vim-fugitive",

	-- LSP
	{ 'williamboman/nvim-lsp-installer' },
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },

	{ 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
	{ 'neovim/nvim-lspconfig' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'L3MON4D3/LuaSnip' },
	-- END LSP

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	"github/copilot.vim",
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		'numToStr/Comment.nvim',
		lazy = false,
	},
}
