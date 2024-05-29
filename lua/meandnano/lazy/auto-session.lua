return {
	'rmagatti/auto-session',
	keys = {
		{ "<leader>Ss", "<cmd>SessionSave<CR>",    desc = "Save session" },
		{ "<leader>Sr", "<cmd>SessionRestore<CR>", desc = "Restore session" },
	},
	config = function()
		require("auto-session").setup {
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
		}
		vim.o.scrolloff = 20
	end
}
