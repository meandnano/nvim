vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fu", vim.cmd.Ex, {desc = "go to directory"})

-- preserve buffer on paste (greates remap ever!)
vim.keymap.set("x", "<leader>p", "\"_dP", {desc = "preserve buffer on paste"})

-- yank into the system buffer (next greatest remap)
vim.keymap.set("n", "<leader>y", "\"+y", {desc = "yank to clipboard"})
vim.keymap.set("n", "<leader>Y", "\"+Y", {desc = "yank to clipboard"})
vim.keymap.set("v", "<leader>y", "\"+y", {desc = "yank to clipboard"})

-- move selection up/down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- up

-- while scrolling through search results, keep the cursom in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "Q", "<nop>")

-- start replacing the current wod
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = "replace current word"})

vim.keymap.set("n", "<leader>cfb", function()
	vim.lsp.buf.format()
end, {desc = "format buffer"})

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", {desc = "quickfix next"})
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", {desc = "quickfix prev"})

vim.keymap.set("n", "<leader>bb", function()
	print(vim.fn.FugitiveHead(8))
end)
