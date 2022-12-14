local vim = vim

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.laststatus = 3
vim.opt.mouse = 'a'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.timeoutlen=300
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.cmd('set relativenumber')
vim.opt.cmdheight = 1
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 520
vim.opt.undofile = true
vim.cmd('filetype plugin on')
vim.opt.backup = false
vim.cmd('set showbreak=\\')
vim.cmd('set linebreak')
vim.cmd('set breakindent')
