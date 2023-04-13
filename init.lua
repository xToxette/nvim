vim = vim

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
  use 'ellisonleao/gruvbox.nvim'
  use 'sainnhe/gruvbox-material'
  use 'tribela/vim-transparent'
  use 'aktersnurra/no-clown-fiesta.nvim'
  use 'marko-cerovac/material.nvim'
  use 'Mofiqul/dracula.nvim'
  use 'shaeinst/roshnivim-cs'
  use 'Mofiqul/adwaita.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'J0sueTM/gruber-darker-vim'
  use 'chriskempson/base16-vim'
  use { "briones-gabriel/darcula-solid.nvim", requires = "rktjmp/lush.nvim" }
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "bluz71/vim-moonfly-colors", branch = "cterm-compat" }
  use {
    "meliora-theme/neovim",
    requires = { "rktjmp/lush.nvim" }
  }
  use { "jacoborus/tender.vim" }


  use {
    "glepnir/dashboard-nvim",
    event = 'VimEnter',
    config = function ()
      require('dashboard').setup {

      }
    end,
    requires = {'nvim-tree/nvim-web-devicons'}
  }
  use "tpope/vim-commentary"

  -- Getting the nvim-tree plugin that makes
  -- Nvim be able to display a directory tree
  -- at the side
  -- use {
  --   'kyazdani42/nvim-tree.lua',
  --   requires = {
  --     'kyazdani42/nvim-web-devicons'
  --   },
  --   tag = 'nightly',
  --   config = function()
  --     local opts = { noremap=true, silent=true }
  --     require('nvim-tree').setup {
  --       vim.keymap.set('n', '<leader>tt', "<cmd>NvimTreeToggle<CR>", opts),
  --       vim.keymap.set('n', '<leader>tf', "<cmd>NvimTreeFocus<CR>", opts),
  --     }
  --   end
  -- }

  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use 'nvim-tree/nvim-web-devicons'

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
        "nvim-lua/plenary.nvim",
        'nvim-tree/nvim-web-devicons',
        "MunifTanjim/nui.nvim",
    },
    config = function ()
      vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

      require("neo-tree").setup({
        close_if_last_window = false,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,

        window = {
          width = 40,
          mappings = {
            ["e"] = "open",
          }
        },
      })
    end
  }

  -- Plugin that enables electric pairing for
  -- things like brackets
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({
        check_ts = true,
      })
    end
  }

  -- Neogit is a magit like plugin for neovim. Here
  -- I setup the plugin with a keybind to access the
  -- magit menu
  use {
    'TimUntersberger/neogit',
    config = function()
      local opts = {noremap=true, silent=true}
      require('neogit').setup {
        vim.keymap.set('n', '<leader>gm', "<cmd>Neogit<CR>", opts),
      }
    end,
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  use {
    'folke/which-key.nvim',
    config = function()
      require("which-key").setup {
        window = {
          border = "single"
        },
      }
    end
  }

  use { 'windwp/nvim-ts-autotag' }

  -- Treesitter is a almost a required plugin for neovim
  -- that makes reading, code a lot better.
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "c", "lua", "rust", "c_sharp", "python", "bash", "java", "astro" },
        sync_install = false,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        autotag = {
          enable = true,
          filetypes = { 'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript', 'astro',
            'xml',
            'php',
            'markdown',
            'glimmer','handlebars','hbs'
          }
        }
      }
    end
  }
  use 'nvim-treesitter/nvim-treesitter-refactor'

  -- Telescope makes finding files in your project easy. 
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      local opts = {noremap=true, silent=true}
      vim.keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<CR>", opts)
      vim.keymap.set('n', '<leader>gf', "<cmd>Telescope git_files<CR>", opts)
      vim.keymap.set('n', '<leader>fg', "<cmd>Telescope live_grep<CR>", opts)
      vim.keymap.set('n', '<leader>fb', "<cmd>Telescope buffers<CR>", opts)
      vim.keymap.set('n', '<leader>fh', "<cmd>Telescope help_tags<CR>", opts)
    end
  }


  -- Project is a plugin that makes sure your vim is rooted at the
  -- project's root of the project you just opened. It also keeps
  -- track of their location, and integrating it with telescope
  -- makes opening your projects really easy
  use {
    'ahmedkhalf/project.nvim',
    requires = 'nvim-telescope/telescope.nvim',
    config = function()
      local opts = {noremap=true, silent=true}
      require("project_nvim").setup {
        -- setup custom settings for project.nvim
        require('telescope').load_extension('projects'),
        vim.keymap.set('n', '<leader>pp', "<cmd>Telescope projects<CR>", opts)
      }
    end
  }

  use {
    'nvim-telescope/telescope-ui-select.nvim',
    requires = 'nvim-telescope/telescope.nvim',
    config = function()
      require('telescope').load_extension('ui-select')
    end
  }

  use {
      'folke/todo-comments.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = function ()
          require("todo-comments").setup {

          }
      end
  }


  use {
      'norcalli/nvim-colorizer.lua',
      config = function ()
          require('colorizer').setup()
      end
  }

  use {
      'akinsho/toggleterm.nvim',
      tag = '*',
      config = function ()
        require("toggleterm").setup()

        require('which-key').register({
            ["<leader>ut"] = { name = "+Terminal"},
            ["<leader>utt"] = { "<cmd>ToggleTerm<CR>", " to window left"},
        }, {mode = "n"})

        require('which-key').register({
            ["<esc>"] = { "<C-\\><C-n>", "Escape Terminal"},
            ["<C-h>"] = { [[<cmd>wincmd h<CR>]], "Escape Terminal left"},
            ["<C-j>"] = { [[<cmd>wincmd j<CR>]], "Escape Terminal down"},
            ["<C-k>"] = { [[<cmd>wincmd k<CR>]], "Escape Terminal up"},
            ["<C-l>"] = { [[<cmd>wincmd l<CR>]], "Escape Terminal right"},
        }, {mode = "t"})
      end
  }

  -- All the plugins below here are too complicated to setup
  -- inside the packer config, so the setup is found at the
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'

  use 'jose-elias-alvarez/null-ls.nvim'
  use 'MunifTanjim/prettier.nvim'

  use 'folke/lsp-colors.nvim'

  use {
    'ms-jpq/coq_nvim',
    branch = "coq"
  }
  use {
    'ms-jpq/coq.artifacts',
    branch = "artifacts"
  }

  use {
    'ms-jpq/coq.thirdparty',
    branch = "3p"
  }

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use {
      "lewis6991/hover.nvim",
      config = function()
          require("hover").setup {
              init = function()
                require("hover.providers.lsp")
              end,
              preview_window = false,
              title = true,
          }
      end
  }

  use 'simrat39/rust-tools.nvim'

  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

end)


require("main")
require("lsp")

