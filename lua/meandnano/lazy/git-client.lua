-- Neogit is a better (than Fugitive) clone of Magit
return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed, not both.
		"nvim-telescope/telescope.nvim", -- optional
		"ibhagwan/fzf-lua",            -- optional
	},
	keys = {
		{ "<leader>gg", "<cmd>Neogit<CR>" }
	},
	config = function()
		require("neogit").setup {}
	end
}
