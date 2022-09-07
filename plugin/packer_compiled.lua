-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/xtoxette/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/xtoxette/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/xtoxette/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/xtoxette/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/xtoxette/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["adwaita.nvim"] = {
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/adwaita.nvim",
    url = "https://github.com/Mofiqul/adwaita.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gruber-darker-vim"] = {
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/gruber-darker-vim",
    url = "https://github.com/J0sueTM/gruber-darker-vim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  neogit = {
    config = { "\27LJ\2\n¦\1\0\0\n\0\n\1\0175\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0014\3\3\0006\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\b\0'\b\t\0\18\t\0\0B\4\5\0?\4\0\0B\1\2\1K\0\1\0\20<cmd>Neogit<CR>\15<leader>gm\6n\bset\vkeymap\bvim\nsetup\vneogit\frequire\1\0\2\fnoremap\2\vsilent\2\3€€À™\4\0" },
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n÷\1\0\0\n\0\f\1\0265\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0014\3\3\0006\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\b\0'\b\t\0\18\t\0\0B\4\5\2>\4\1\0036\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\n\0'\b\v\0\18\t\0\0B\4\5\0?\4\0\0B\1\2\1K\0\1\0\27<cmd>NvimTreeFocus<CR>\15<leader>tf\28<cmd>NvimTreeToggle<CR>\15<leader>tt\6n\bset\vkeymap\bvim\nsetup\14nvim-tree\frequire\1\0\2\fnoremap\2\vsilent\2\5€€À™\4\0" },
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n¸\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\1\17sync_install\1\1\b\0\0\6c\blua\trust\fc_sharp\vpython\tbash\tjava\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\nö\1\0\0\n\0\r\1\0245\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0014\3\3\0006\4\1\0'\6\4\0B\4\2\0029\4\5\4'\6\6\0B\4\2\2>\4\1\0036\4\a\0009\4\b\0049\4\t\4'\6\n\0'\a\v\0'\b\f\0\18\t\0\0B\4\5\0?\4\0\0B\1\2\1K\0\1\0 <cmd>Telescope projects<CR>\15<leader>pp\6n\bset\vkeymap\bvim\rprojects\19load_extension\14telescope\nsetup\17project_nvim\frequire\1\0\2\fnoremap\2\vsilent\2\5€€À™\4\0" },
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["roshnivim-cs"] = {
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/roshnivim-cs",
    url = "https://github.com/shaeinst/roshnivim-cs"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n›\3\0\0\a\0\15\0*5\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\a\0'\5\b\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\t\0'\5\n\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\v\0'\5\f\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\r\0'\5\14\0\18\6\0\0B\1\5\1K\0\1\0!<cmd>Telescope help_tags<CR>\15<leader>fh\31<cmd>Telescope buffers<CR>\15<leader>fb!<cmd>Telescope live_grep<CR>\15<leader>fg!<cmd>Telescope git_files<CR>\15<leader>gf\"<cmd>Telescope find_files<CR>\15<leader>ff\6n\bset\vkeymap\bvim\1\0\2\fnoremap\2\vsilent\2\0" },
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n^\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vwindow\1\0\0\1\0\1\vborder\vsingle\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/xtoxette/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n›\3\0\0\a\0\15\0*5\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0'\5\6\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\a\0'\5\b\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\t\0'\5\n\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\v\0'\5\f\0\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\r\0'\5\14\0\18\6\0\0B\1\5\1K\0\1\0!<cmd>Telescope help_tags<CR>\15<leader>fh\31<cmd>Telescope buffers<CR>\15<leader>fb!<cmd>Telescope live_grep<CR>\15<leader>fg!<cmd>Telescope git_files<CR>\15<leader>gf\"<cmd>Telescope find_files<CR>\15<leader>ff\6n\bset\vkeymap\bvim\1\0\2\fnoremap\2\vsilent\2\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n¦\1\0\0\n\0\n\1\0175\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0014\3\3\0006\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\b\0'\b\t\0\18\t\0\0B\4\5\0?\4\0\0B\1\2\1K\0\1\0\20<cmd>Neogit<CR>\15<leader>gm\6n\bset\vkeymap\bvim\nsetup\vneogit\frequire\1\0\2\fnoremap\2\vsilent\2\3€€À™\4\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n÷\1\0\0\n\0\f\1\0265\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0014\3\3\0006\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\b\0'\b\t\0\18\t\0\0B\4\5\2>\4\1\0036\4\4\0009\4\5\0049\4\6\4'\6\a\0'\a\n\0'\b\v\0\18\t\0\0B\4\5\0?\4\0\0B\1\2\1K\0\1\0\27<cmd>NvimTreeFocus<CR>\15<leader>tf\28<cmd>NvimTreeToggle<CR>\15<leader>tt\6n\bset\vkeymap\bvim\nsetup\14nvim-tree\frequire\1\0\2\fnoremap\2\vsilent\2\5€€À™\4\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n^\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vwindow\1\0\0\1\0\1\vborder\vsingle\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\nö\1\0\0\n\0\r\1\0245\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0014\3\3\0006\4\1\0'\6\4\0B\4\2\0029\4\5\4'\6\6\0B\4\2\2>\4\1\0036\4\a\0009\4\b\0049\4\t\4'\6\n\0'\a\v\0'\b\f\0\18\t\0\0B\4\5\0?\4\0\0B\1\2\1K\0\1\0 <cmd>Telescope projects<CR>\15<leader>pp\6n\bset\vkeymap\bvim\rprojects\19load_extension\14telescope\nsetup\17project_nvim\frequire\1\0\2\fnoremap\2\vsilent\2\5€€À™\4\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n¸\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\1\17sync_install\1\1\b\0\0\6c\blua\trust\fc_sharp\vpython\tbash\tjava\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
