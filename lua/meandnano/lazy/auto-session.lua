return {
	'rmagatti/auto-session',
	keys = {
		{ "<leader>ss", "<cmd>SessionSave<CR>" },
		{ "<leader>sr", "<cmd>SessionRestore<CR>" },
	},
	config = function()
		require("auto-session").setup {
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
		}
		vim.o.scrolloff = 20
	end
}
