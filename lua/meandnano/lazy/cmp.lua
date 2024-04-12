return {
	'hrsh7th/nvim-cmp',
	config = function()
		local cmp = require('cmp')
		cmp.setup({ mapping = {
				['<Down>'] = cmp.mapping.scroll_docs(-4),
				['<Up>'] = cmp.mapping.scroll_docs(4),
				['<C-y>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.close(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
			}
		})
	end
}
