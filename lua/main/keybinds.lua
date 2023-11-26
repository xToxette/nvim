local vim = vim

local wk = require('which-key')

wk.register({
  ["<C-s>"] = { "<cmd>w<CR>", "Save File" },
  ["<C-Q>"] = { "<cmd>wq!<CR>", "Save and Quit File" },

  ["<C-h>"] = { "<C-w>h", "Go to window left"},
  ["<C-j>"] = { "<C-w>j", "Go to window down"},
  ["<C-k>"] = { "<C-w>k", "Go to window up"},
  ["<C-l>"] = { "<C-w>l", "Go to window right"},


  ["<leader>u"] = { name = "+utils" },
  ["<leader>uc"] = { "<cmd>Commentary<CR>", "(un)comment" },

  ["<C-e>"] = { "<cmd>Neotree toggle<CR>", "Toggle Neotree" },
  ["<leader>t"] = { name = "+nvim tree" },
  ["<leader>tt"] = { "<cmd>Neotree toggle<CR>", "Toggle Neotree" },


  ["<leader>g"] = { name = "+git" },


  ["<leader>f"] = { name = "+find" },


  ["<leader>p"] = { name = "+project" },


  ["<leader>v"] = { name = "+view" },
  ["<leader>vo"] = { "<cmd>only<CR>", "Only"},
  ["<leader>vs"] = { name = "+split window" },
  ["<leader>vsb"] = { "<cmd>split<CR>", "split horizontal"},
  ["<leader>vsl"] = { "<cmd>vsplit<CR>", "split vertical"},
})
