local vim = vim

local cmp = require('cmp')

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}


cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered({

    }),
    documentation = cmp.config.window.bordered(),
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n"] = cmp.mapping.select_next_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({}),
    ["<Tab>"] = cmp.mapping(function (fallback)
        if cmp.visible() then
            local entry = cmp.get_selected_entry()
            if not entry then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
                cmp.confirm()
            end
        else
            fallback()
        end
    end, {"i", "s", "c",})
  }),
  sources = {
    { name = 'nvim_lsp', priority = 3, keyword_length = 1 },
    { name = 'luasnip', priority = 2 },
    { name = 'buffer', priority = 1 },
  },
  formatting = {
    fiels = {'menu', 'abbr', 'kind'},
    format = function(entry, item)
        item.kind = string.format("%s %s", kind_icons[item.kind], item.kind)
        item.menu = ({
            buffer = "[Buffer]",
            nvim_lsp = "[LSP]",
            luasnip = "[LuaSnip]",
            nvim_lua = "[Lua]",
            latex_symbol = "[LaTeX]"
        })[entry.source.name]
        item.abbr = string.sub(item.abbr, 1, 40);
	    return item
    end,
  },
})

cmp.setup.cmdline({'/', '?'}, {
    view = {
        entries = { name = "wildmenu", separator = ' | ' }
    },
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" }
    }
})

cmp.setup.cmdline(':', {
    view = {
        entries = { name = "wildmenu", separator = ' | ' }
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "cmdline" }
    })
})
