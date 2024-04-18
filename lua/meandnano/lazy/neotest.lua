return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neotest/nvim-nio",
			"nvim-neotest/neotest-go",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"marilari88/neotest-vitest",
			"nvim-neotest/neotest-plenary",
		},
		config = function()
			local neotest = require("neotest")
			neotest.setup({
				adapters = {
					require("neotest-go")({
						args = { "-v", "-race" },
					}),
				}
			})

			vim.keymap.set("n", "<leader>tr", function() neotest.run.run() end,
				{ desc = "run test" })
			vim.keymap.set("n", "<leader>tt", function() neotest.output_panel.toggle() end, { desc = "toggle output panel" })
			vim.keymap.set("n", "<leader>t2", function() neotest.watch() end, { desc = "test watch" })
		end,
	},
}
