return {
	"folke/todo-comments.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{ "<leader>pt", "<cmd>TodoTelescope<CR>", desc = "Show project TODOs" },
	},
	config = function()
		require("todo-comments").setup({
			highlight = {
				keyword = "fg",
				pattern = [[<(KEYWORDS)]],
			},
			search = {
				pattern = [[\b(KEYWORDS)\b]],
			}
		})
	end
}
