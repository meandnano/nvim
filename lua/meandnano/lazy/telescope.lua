return {
	"nvim-telescope/telescope.nvim",

	tag = "0.1.5",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"smartpde/telescope-recent-files"
	},

	config = function()
		local tele = require('telescope')
		tele.setup({
			extensions = {
				recent_files = {
					only_cwd = true,
				}
			}
		})

		tele.load_extension('recent_files')

		vim.keymap.set("n", "<Leader><Leader>", [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]])

		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "search for file" })
		vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = "search for file under git repo" })
		vim.keymap.set('n', '<leader>bb', builtin.buffers, { desc = "show open buffers" })
		vim.keymap.set('n', '<leader>hh', builtin.help_tags, { desc = "search for help" })
		vim.keymap.set('n', '<leader>ce', function() builtin.diagnostics { bufnr = 0 } end, { desc = "show lsp diagnostics" })
		vim.keymap.set('n', '<leader>ce', builtin.diagnostics, { desc = "show lsp diagnostics (all buffers)" })

		-- Grep within project
		vim.keymap.set('n', '<leader>ps', function()
			builtin.grep_string({ search = vim.fn.input("Grep project > ") })
		end, { desc = "grep in the project" })
	end
}
