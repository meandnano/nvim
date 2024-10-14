return {
	"github/copilot.vim",
	config = function()
		vim.api.nvim_set_keymap("i", "<S-Tab>", "<Plug>(copilot-accept-word)", {})
	end,
}
