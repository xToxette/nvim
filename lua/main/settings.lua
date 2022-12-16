local vim = vim


vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.laststatus = 3
vim.opt.mouse = 'a'
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.timeoutlen=300
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 8

vim.opt.cmdheight = 1

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

vim.opt.updatetime = 50

vim.cmd('filetype plugin on')
vim.cmd('set showbreak=\\')
vim.cmd('set linebreak')
vim.cmd('set breakindent')
