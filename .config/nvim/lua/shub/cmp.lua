-- Setup nvim-cmp.
local cmp = require'cmp'

require "cmp_nvim_lsp"
require "cmp_buffer"
require "cmp_path"
-- require "cmp_nvim_ultisnips"
-- require "cmp_nvim_lua"
-- require "cmp_calc"
-- require "cmp_emoji"

-- Setup tabnine
-- local tabnine = require('cmp_tabnine.config')
-- tabnine:setup({
--         max_lines = 1000;
--         max_num_results = 20;
--         sort = true;
-- })

-- icons
local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "ﰠ",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "塞",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "פּ",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

-- main cmp setup
cmp.setup({
  snippet = {
    expand = function(args)
      --- vim.fn["UltiSnips#Anon"](args.body)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` user
    end,
  },
  mapping = {
	['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
	['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert , select = false }),
	['<C-d>'] = cmp.mapping.scroll_docs(-4),
    	['<C-f>'] = cmp.mapping.scroll_docs(4),
    	['<C-Space>'] = cmp.mapping.complete(),
    	['<C-e>'] = cmp.mapping.close()
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    -- { name = 'ultisnips' }
    { name = 'vsnip'},
    -- { name = 'cmp_tabnine' },
  },
  completion = {
    -- completeopt = 'menu,menuone,noinsert',
    autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged }
    -- autocomplete = false
	},
  formatting = {
    format = function(entry, vim_item)
      -- fancy icons and a name of kind
      vim_item.kind = kind_icons[vim_item.kind] .. " " .. vim_item.kind

      -- set a name for each source
      vim_item.menu = ({
        buffer = "[Buffer]",
        path = "[Path]",
        nvim_lsp = "[LSP]",
	-- ultisnips = "[UltiSnips]",
        -- nvim_lua = "[Lua]",
        -- calc = "[Calc]",
        -- emoji = "[Emoji]",
        -- cmp_tabnine = "[TabNine]",
      })[entry.source.name]

      return vim_item
    end,
  }
})
