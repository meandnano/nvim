-- disable netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		function onAttachTree(bufnr)
			-- optionally enable 24-bit colour
			vim.opt.termguicolors = true

			local api = require "nvim-tree.api"

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
			vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))

			vim.keymap.set('n', '<leader>op', api.tree.toggle, opts("Toggle"))
			vim.keymap.set('n', '<C-r>', api.tree.reload, opts("Toggle"))
		end

		require("nvim-tree").setup {
			disable_netrw = false,
			hijack_netrw = false,
			on_attach = onAttachTree,
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
		}

		vim.keymap.set('n', '<leader>op', ':NvimTreeFocus<CR>', { desc = "Focus NvimTree" })
		vim.keymap.set('n', '<leader>-', ':NvimTreeFocus<CR>', { desc = "Focus NvimTree" })
	end
}
