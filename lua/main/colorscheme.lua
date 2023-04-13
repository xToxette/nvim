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

vim.cmd ('set termguicolors')

vim.g.material_style = "darker"
vim.o.background = "dark"
vim.g.gruvbox_material_background = "hard"

vim.cmd 'colorscheme material'

