return {
	"nvim-telescope/telescope.nvim",

	tag = "0.1.5",

	dependencies = {
		"nvim-lua/plenary.nvim"
	},

	config = function()
		require('telescope').setup({})

		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "search for file" })
		vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = "search for file under git repo" })

		-- Grep within project
		vim.keymap.set('n', '<leader>ps', function()
			builtin.grep_string({ search = vim.fn.input("Grep project > ") })
		end, { desc = "grep in the project" })
	end
}
