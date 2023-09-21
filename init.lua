vim = vim

local execute = vim.api.nvim_command
local fn = vim.fn

vim.g.mapleader = " "

vim.opt.termguicolors = true


-- Ensuring that packer is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
  "git",
  "clone",
  "--filter=blob:none",
  "https://github.com/folke/lazy.nvim.git",
  "--branch=stable",
  lazypath,
})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { 'wbthomason/packer.nvim', lazy = true },
  'ellisonleao/gruvbox.nvim',
  'sainnhe/gruvbox-material',
  'aktersnurra/no-clown-fiesta.nvim',
  'marko-cerovac/material.nvim',
  'Mofiqul/dracula.nvim',
  'shaeinst/roshnivim-cs',
  'Mofiqul/adwaita.nvim',
  'EdenEast/nightfox.nvim',
  'J0sueTM/gruber-darker-vim',
  'nyoom-engineering/oxocarbon.nvim',
  'chriskempson/base16-vim',
  { "briones-gabriel/darcula-solid.nvim", dependencies = "rktjmp/lush.nvim" },
  { "catppuccin/nvim", name = "catppuccin" },
  { "bluz71/vim-moonfly-colors", branch = "cterm-compat" },

  { "meliora-theme/neovim", dependencies = { "rktjmp/lush.nvim" } },

  { "jacoborus/tender.vim" },

  -- For transparent background
  {
    'tribela/vim-transparent',
    config = function ()
      -- vim.cmd("let g:transparent_groups += ['NormalFloat']")
    end,
  },

  {
    "glepnir/dashboard-nvim",
    event = 'VimEnter',
    config = function ()
      require('dashboard').setup {

      }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },

  "tpope/vim-commentary",

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

  {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
  },

  'nvim-tree/nvim-web-devicons',

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
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
  },

  -- Plugin that enables electric pairing for
  -- things like brackets
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({
        check_ts = true,
      })
    end
  },

  -- Neogit is a magit like plugin for neovim. Here
  -- I setup the plugin with a keybind to access the
  -- magit menu
  {
    'TimUntersberger/neogit',
    config = function()
      local opts = {noremap=true, silent=true}
      require('neogit').setup {
        vim.keymap.set('n', '<leader>gm', "<cmd>Neogit<CR>", opts),
      }
    end,
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },

  {
    'folke/which-key.nvim',
    config = function()
      require("which-key").setup {
        window = {
          border = "single"
        },
      }
    end
  },

  'windwp/nvim-ts-autotag',

  -- Treesitter is a almost a required plugin for neovim
  -- that makes reading, code a lot better.
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
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
  },

  'nvim-treesitter/nvim-treesitter-refactor',

  -- Telescope makes finding files in your project easy.
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { {'nvim-lua/plenary.nvim'} },
    config = function()
      local opts = {noremap=true, silent=true}
      vim.keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<CR>", opts)
      vim.keymap.set('n', '<leader>gf', "<cmd>Telescope git_files<CR>", opts)
      vim.keymap.set('n', '<leader>fg', "<cmd>Telescope live_grep<CR>", opts)
      vim.keymap.set('n', '<leader>fb', "<cmd>Telescope buffers<CR>", opts)
      vim.keymap.set('n', '<leader>fh', "<cmd>Telescope help_tags<CR>", opts)
    end
  },


  -- Project is a plugin that makes sure your vim is rooted at the
  -- project's root of the project you just opened. It also keeps
  -- track of their location, and integrating it with telescope
  -- makes opening your projects really easy
  {
    'ahmedkhalf/project.nvim',
    dependencies = 'nvim-telescope/telescope.nvim',
    config = function()
      local opts = {noremap=true, silent=true}
      require("project_nvim").setup {
        -- setup custom settings for project.nvim
        require('telescope').load_extension('projects'),
        vim.keymap.set('n', '<leader>pp', "<cmd>Telescope projects<CR>", opts)
      }
    end
  },

  {
    'nvim-telescope/telescope-ui-select.nvim',
    dependencies = 'nvim-telescope/telescope.nvim',
    config = function()
      require('telescope').load_extension('ui-select')
    end
  },

  {
      'folke/todo-comments.nvim',
      dependencies = 'nvim-lua/plenary.nvim',
      config = function ()
          require("todo-comments").setup {

          }
      end
  },


  {
      'norcalli/nvim-colorizer.lua',
      config = function ()
          require('colorizer').setup()
      end
  },

  {
      'akinsho/toggleterm.nvim',
      version = '*',
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
  },

  -- All the plugins below here are too complicated to setup
  -- inside the packer config, so the setup is found at the
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',

  'jose-elias-alvarez/null-ls.nvim',
  'MunifTanjim/prettier.nvim',

  'folke/lsp-colors.nvim',

  {
    'ms-jpq/coq_nvim',
    branch = "coq"
  },

  {
    'ms-jpq/coq.artifacts',
    branch = "artifacts"
  },

  {
    'ms-jpq/coq.thirdparty',
    branch = "3p"
  },

  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'saadparwaiz1/cmp_luasnip',
  {
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
  },

  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup({
        suggestion = { enable = false },
        panel = { enable = false }
      })
    end,
  },


  {
    'zbirenbaum/copilot-cmp',
    after = { 'copilot.lua' },
    config = function ()
      require('copilot_cmp').setup()
    end
  },


  'simrat39/rust-tools.nvim',

  'L3MON4D3/LuaSnip',
  'rafamadriz/friendly-snippets',
})

require("main")
require("lsp")

