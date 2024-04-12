require('meandnano.set')
require('meandnano.remap')
require('meandnano.install_lazy')

local augroup = vim.api.nvim_create_augroup
local MeandnanoGroup = augroup('MeandnanoGroup', {})

local autocmd = vim.api.nvim_create_autocmd

-- LSP kyemapping
autocmd('LspAttach', {
	group = MeandnanoGroup,
	callback = function(e)
		local opts = function(description) return { buffer = e.buf, desc = description } end

		vim.keymap.set('n', '<leader>cd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts("go to definition"))
		--vim.keymap.set('n', '<leader>cD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts("go to declaration"))
		vim.keymap.set('n', '<leader>ci', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts("go to implementation"))
		vim.keymap.set('n', '<leader>co', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts("go to type definition"))
		vim.keymap.set('n', '<leader>cD', '<cmd>lua vim.lsp.buf.references()<cr>', opts("go to references"))
		vim.keymap.set("n", "<leader>ck", function() vim.lsp.buf.hover() end, opts("show hover"))

		vim.keymap.set("n", "<leader>cws", function() vim.lsp.buf.workspace_symbol() end, opts("search workspace"))
		vim.keymap.set("n", "<leader>cvd", function() vim.diagnostic.open_float() end, opts("open diagnostic"))
		vim.keymap.set("n", "<leader>cca", function() vim.lsp.buf.code_action() end, opts("code action"))
		vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.rename() end, opts("rename"))

		vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts("signature help"))
		vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts("go to next diagnostic"))
		vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts("go to previous diagnostic"))

		vim.keymap.set('n', '<space>cfb', function()
			vim.lsp.buf.format { async = true }
		end, opts("format buffer"))
	end
})

-- Format on save
autocmd('BufWritePre', {
	group = MeandnanoGroup,
	pattern = { '*.go', '*.lua' },
	callback = function(e)
		if vim.bo.filetype == 'lua' then
			vim.lsp.buf.format { async = true }
		end
	end
})
