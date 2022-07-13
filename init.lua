local vim = vim

local execute = vim.api.nvim_command
local fn = vim.fn

vim.g.mapleader = " "

-- Ensuring that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')

local packer = require'packer'
local util = require'packer.util'

packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})


-- Enabling all the package needed for my configuration.
-- This does not include setup for each specific plugin.
-- Plugin setups are found below this funtion
require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim', opt = true }
  use 'nvim-treesitter/nvim-treesitter'
  use 'marko-cerovac/material.nvim'
  use 'ellisonleao/gruvbox.nvim'

  -- Plugins for setting up the lsp that is built in with
  -- neovim.
  use 'williamboman/nvim-lsp-installer'
  use 'neovim/nvim-lspconfig'
  use 'folke/lsp-colors.nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'nvim-treesitter/nvim-treesitter-refactor'

  -- Rust plugins
  use 'simrat39/rust-tools.nvim'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  use 'windwp/nvim-autopairs'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end)


-- Default options

require('material').setup({
  contrast = {
    floating_windows = true,
  },
})

vim.cmd 'set termguicolors'

vim.g.material_style = "darker"
vim.cmd 'colorscheme material'
--vim.opt.background = "dark"
--vim.cmd 'colorscheme gruvbox'


vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.laststatus = 3
vim.opt.mouse = 'a'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.cmd('set norelativenumber')
vim.opt.cmdheight = 1
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 520
vim.opt.undofile = true
vim.cmd('filetype plugin on')
vim.opt.backup = false


-- Config for the nvim-treesitter plugin
local treesitterconfig = require'nvim-treesitter.configs'
treesitterconfig.setup {
  ensure_installed = { "c", "lua", "rust", "c_sharp", "python", "bash" },
  sync_install = false,
  highlight = {
    enable = true,
  }
}

-- autopairs setup
require("nvim-autopairs").setup({
  check_ts = true,
})

-- Custom Settings for the material theme
require('material').setup({
  contrast = {
    floating_windows = true,
  }
})

-- =======================================
-- Setting up Telescope
-- =======================================

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<CR>", opts)
vim.keymap.set('n', '<leader>fg', "<cmd>Telescope live_grep<CR>", opts)
vim.keymap.set('n', '<leader>fb', "<cmd>Telescope buffers<CR>", opts)
vim.keymap.set('n', '<leader>fh', "<cmd>Telescope help_tags<CR>", opts)


-- =======================================
-- Setting up LSP and Autocomplete
-- =======================================
-- First settingup nvim-cmp
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    --completion = cmp.config.window.bordered(),
    --documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n"] = cmp.mapping.select_next_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Now setting up lsp
require("nvim-lsp-installer").setup {}


local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>qq', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<space>e', vim.diagnostic.show, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>dd', "<cmd>Telescope diagnostics<CR>", opts)

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  --virtual_text = {
  --  -- source = "always",  -- Or "if_many"
  --  prefix = '●', -- Could be '■', '▎', 'x'
  --},
  virtual_text = false;
  severity_sort = true,
  float = {
    source = "always",  -- Or "if_many"
  },
  signs = true,
  update_in_insert = true,
  underline = true,
})


local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
end


local lspconfig = require("lspconfig")
lspconfig.sumneko_lua.setup{
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.bashls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.clangd.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.rust_analyzer.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}
require('rust-tools').setup({})

lspconfig.omnisharp.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}
