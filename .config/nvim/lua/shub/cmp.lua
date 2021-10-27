-- Setup nvim-cmp.
local cmp = require'cmp'

require "cmp_nvim_lsp"
require "cmp_buffer"
require "cmp_path"
require "cmp_nvim_ultisnips"
-- require "cmp_nvim_lua"
-- require "cmp_calc"
-- require "cmp_emoji"

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

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
      vim.fn["UltiSnips#Anon"](args.body)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` user
    end,
  },
  mapping = {
  		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<Tab>'] = cmp.mapping(function(fallback)
			if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
				vim.fn.feedkeys(t("<esc>:call UltiSnips#JumpForwards()<CR>"))
			elseif cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s"}),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
				vim.fn.feedkeys(t("<C-R>=UltiSnips#JumpBackwards()<CR>"))
			elseif cmp.visible() then
				cmp.select_prev_item()
			end
		end, { "i", "s"}),
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({ -- remapped at bottom by autopairs
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),
		-- ['<C-Space>'] = cmp.mapping.complete(),
		['<C-Space>'] = cmp.mapping(function(fallback)
			-- print(vim.inspect(vim.fn.complete_info()))
			if vim.fn.pumvisible() == 1 then
				if vim.fn.complete_info()["selected"] ~= -1 then
					if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
						return vim.fn.feedkeys(t("<C-R>=UltiSnips#ExpandSnippet()<CR>"))
					else
						vim.fn.feedkeys(t("<cr>"), "n")
          end
				else
					vim.fn.feedkeys(t("<C-e>"), "n")
				end
			--[[ elseif check_back_space() then
				vim.fn.feedkeys(t("<cr>"), "n") ]]
			else
				cmp.complete()  -- invoke popup
				-- fallback()
			end
		end, { "i", "s", }),



	  -- old
	--['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
	--['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert , select = false }),
    	--['<C-Space>'] = cmp.mapping.complete(),
	--['<C-d>'] = cmp.mapping.scroll_docs(-4),
	--['<C-f>'] = cmp.mapping.scroll_docs(4),
    	--['<C-e>'] = cmp.mapping.close()
  },
  sources = {
    { name = 'nvim_lsp' , keyword_length = 5},
    { name = 'buffer', keyword_length = 5 },
    { name = 'path' },
    { name = 'ultisnips' }
    -- { name = 'vsnip'},
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
	ultisnips = "[UltiSnips]",
        -- nvim_lua = "[Lua]",
        -- calc = "[Calc]",
        -- emoji = "[Emoji]",
        -- cmp_tabnine = "[TabNine]",
      })[entry.source.name]

      return vim_item
    end,
  }
})
