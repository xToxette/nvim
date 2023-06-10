local vim = vim

require('material').setup({
  contrast = {
    sidebars = false,
    floating_windows = false,
  },
  styles = {
    keywords = { bold = true },
  },
  disable = {
    background = true,
  }
})

vim.cmd ('set termguicolors')

vim.g.material_style = "darker"
vim.opt.background = "dark"
vim.o.background = "dark"
vim.g.gruvbox_material_background = "hard"

vim.cmd 'colorscheme oxocarbon'
