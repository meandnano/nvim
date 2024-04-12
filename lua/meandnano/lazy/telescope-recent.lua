return {
	"smartpde/telescope-recent-files",
	depenencies = {
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require('telescope').load_extension('recent_files')
		vim.api.nvim_set_keymap("n", "<Leader><Leader>",
			[[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
			{ noremap = true, silent = true })
	end
}
