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
			-- get neotest namespace (api call creates or returns namespace)
			local neotest_ns = vim.api.nvim_create_namespace("neotest")
			vim.diagnostic.config({
				virtual_text = {
					format = function(diagnostic)
						local message =
								diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
						return message
					end,
				},
			}, neotest_ns)

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
