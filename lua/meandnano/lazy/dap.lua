return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},

	-- keys = {
	-- 	{ 'n', "<leader>db",     "<cmd>DapToggleBreakPoint<CR>" },
	-- 	{ 'n', "<leader>do", function()
	-- 		require('dap').repl.open()
	-- 	end },
	-- 	{ 'n', "<leader><F7>",   "<cmd>DapStepInto<CR>" },
	-- 	{ 'n', "<leader><F8>",   "<cmd>DapStepOver<CR>" },
	-- 	{ 'n', "<leader><S-F8>", "<cmd>DapStepOut<CR>" },
	-- 	{ 'n', "<leader><S-F9>", "<cmd>DapContinue<CR>" },
	-- },

	config = function()
		require("mason-nvim-dap").setup({
			ensure_installed = { "delve" }
		})

		local dap = require('dap')
		dap.configurations.go = {
			{
				type = 'go', -- is this correct?
				request = 'launch',
				name = "Launch file",
				program = function()
					local path = vim.fn.input({
						prompt = 'Path to executable: ',
						default = vim.fn.getcwd() .. '/',
						completion = 'file'
					})
					return (path and path ~= "") and path or dap.ABORT
				end
			},
		}
	end,
}
