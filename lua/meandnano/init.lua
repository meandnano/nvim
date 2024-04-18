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

		vim.keymap.set('n', '<leader>cff',
			function()
				local builtin = require('telescope.builtin')
				builtin.lsp_document_symbols({
					symbols = { 'function', 'method', 'constant', 'struct', 'interface' },
					show_line = true,
				})
			end,
			{ desc = "show functions" }
		)

		vim.keymap.set('n', '<space>cfb', function()
			vim.lsp.buf.format { async = true }
		end, opts("format buffer"))
	end
})

autocmd({ 'BufRead', 'BufNewFile' }, {
	group = MeandnanoGroup,
	pattern = { '*.gohtml' },
	callback = function(e)
		vim.bo.filetype = 'gotmpl'
		vim.bo.syntax = 'html'
	end
})

-- On save
autocmd('BufWritePre', {
	group = MeandnanoGroup,
	pattern = { '*.go', '*.lua' },
	callback = function(e)
		local is_Modified = function()
			local buf          = vim.api.nvim_get_current_buf()
			-- Check if buffer is actually modified, and only if it is modified,
			-- execute the :CMakeGenerate, otherwise return. This is to avoid unnecessary regenerattion
			local buf_modified = vim.api.nvim_buf_get_option(buf, 'modified')
			return buf_modified
		end

		if not is_Modified() then
			print("Buffer is not modified")
			return
		end

		-- go specific
		if vim.bo.filetype == 'go' then
			-- optimize imports
			local params = vim.lsp.util.make_range_params()
			params.context = { only = { "source.organizeImports" } }
			-- buf_request_sync defaults to a 1000ms timeout. Depending on your
			-- machine and codebase, you may want longer. Add an additional
			-- argument after params if you find that you have to write the file
			-- twice for changes to be saved.
			-- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
			local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
			for cid, res in pairs(result or {}) do
				for _, r in pairs(res.result or {}) do
					if r.edit then
						local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
						vim.lsp.util.apply_workspace_edit(r.edit, enc)
					end
				end
			end
		end

		-- format on save
		vim.lsp.buf.format { async = false }
	end
})
