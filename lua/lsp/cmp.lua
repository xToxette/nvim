local vim = vim

local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n"] = cmp.mapping.select_next_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
    }),
  }),
  sources = {
    { name = 'nvim_lsp', priority = 3, keyword_length = 1 },
    { name = 'luasnip', priority = 2 },
    { name = 'buffer', priority = 1 },
  },
  formatting = {
    fiels = {'menu', 'abbr', 'kind'},
    format = function(entry, item)
        local menu_icon = {
            nvim_lsp = 'λ',
            luasnip = '⋗',
            buffer = 'Ω',
        }
    	item.menu = menu_icon[entry.source.name]
        item.abbr = string.sub(item.abbr, 1, 25);
	    return item
    end,
  },
})