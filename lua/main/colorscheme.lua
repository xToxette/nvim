local vim = vim

require('material').setup({
  contrast = {
    sidebars = false,
    floating_windows = false,
  },
  styles = {
    keywords = { bold = true },
  }
})

vim.cmd 'set termguicolors'
vim.cmd 'colorscheme darcula-solid'
