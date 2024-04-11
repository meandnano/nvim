local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({ buffer = bufnr })
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'gopls',
		'dockerls',
		'docker_compose_language_service',
		'html',
		'jsonls',
		'marksman', -- markdown
		'taplo',   -- TOML
		'hydra_lsp', -- YAML
		'bufls',   -- BUF's protobuf LSP
		'bashls',
		'tsserver',
		'eslint',
		'lua_ls',
	},
	handlers = {
		lsp.default_setup,
	},
})
