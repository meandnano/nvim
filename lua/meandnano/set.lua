vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.smartindent = true

vim.opt.nu = true             -- line numbers
vim.opt.relativenumber = true -- make them relative

vim.g.have_nerd_font = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- keep vim from highlighing all the searches
-- but in a smart way
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- "end of the world sideways"
vim.opt.colorcolumn = "140"

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'
