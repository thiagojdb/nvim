vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.errorbells = false
vim.opt.mouse = nil

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

--vim.opt.clipboard = "unnamedplus"

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 6
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 10

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

vim.opt.guicursor="i:block"
