-- Setup nvim-cmp.
local cmp = require'cmp'

-- Setup tabnine
-- local tabnine = require('cmp_tabnine.config')
-- tabnine:setup({
--         max_lines = 1000;
--         max_num_results = 20;
--         sort = true;
-- })

-- main cmp setup
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` user
    end,
  },
  mapping = {
	['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
	['<CR>'] = cmp.mapping.confirm({ select = true }),
	['<C-d>'] = cmp.mapping.scroll_docs(-4),
    	['<C-f>'] = cmp.mapping.scroll_docs(4),
    	['<C-Space>'] = cmp.mapping.complete(),
    	['<C-e>'] = cmp.mapping.close(),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip'},       -- For luasnip user
    -- { name = 'cmp_tabnine' },
    { name = 'buffer' },
    { name = 'path' }
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
    autocomplete = {require("cmp.types").cmp.TriggerEvent.TextChanged}
    -- autocomplete = false
	}
})
