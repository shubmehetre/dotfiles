-- lsp setup
local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')

local function on_attach()
	-- dont know wat this does xD
end

-- Servers setup
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { "documentation", "detail", "additionalTextEdits" },
}

-- TO INSTALL DO THIS: npm i -g pyright
--require'lspconfig'.pyright.setup {
--	on_attach = on_attach,
--	capabilities = capabilities,
--	root_dir = function() return vim.loop.cwd() end,
--	capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
--}
--
---- html/css/json servers - https://www.npmjs.com/package/vscode-langservers-extracted
---- require'lspconfig'.tsserver.setup{ on_attach=on_attach }
--require'lspconfig'.html.setup{ on_attach=on_attach }
--require'lspconfig'.bashls.setup{ on_attach=on_attach }

local servers = {
	bashls = {},
	pyright = {},
	html = {}
}

for server, config in pairs(servers) do
  lspconfig[server].setup(
    vim.tbl_deep_extend(
      "force",
      {
        capabilities = capabilities,
        on_attach = on_attach,
  	root_dir = function() return vim.loop.cwd() end,
        flags = {
          debounce_text_changes = 250,
        },
      },
      config
    )
  )
end

-- Set Default Prefix.Note: You can set a prefix per lsp server in the lv-globals.lua file
-- inline diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- virtual_text = { prefix = "", spacing = 10},
    virtual_text = false, -- disable inline diagnostics
    signs = true,
    underline = true,
  }
)

-- -- uncomment below to enable nerd-font based icons for diagnostics in the
-- -- gutter, see:
-- -- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#change-diagnostic-symbols-in-the-sign-column-gutter
-- local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
--
-- for type, icon in pairs(signs) do
--   local hl = "LspDiagnosticsSign" .. type
--   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- end

-- symbols for autocomplete
vim.lsp.protocol.CompletionItemKind = {
    "   (Text) ", -- example
    "   (Method)",
    "   (Function)",
    "   (Constructor)",
    " ﴲ  (Field)",
    "[] (Variable)",
    "   (Class)",
    " ﰮ  (Interface)",
    "   (Module)",
    " 襁 (Property)",
    "   (Unit)",
    "   (Value)",
    " 練 (Enum)",
    "   (Keyword)",
    "   (Snippet)",
    "   (Color)",
    "   (File)",
    "   (Reference)",
    "   (Folder)",
    "   (EnumMember)",
    " ﲀ  (Constant)",
    " ﳤ  (Struct)",
    "   (Event)",
    "   (Operator)",
    "   (TypeParameter)"
}

local function documentHighlight(client, bufnr)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
            [[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
            false
        )
    end
end

local lsp_config = {}

function lsp_config.common_on_attach(client, bufnr)
    documentHighlight(client, bufnr)
end

-- local function setup_servers()
--   require'lspinstall'.setup()
--   local servers = require'lspinstall'.installed_servers()
--   for _, server in pairs(servers) do
--     require'lspconfig'[server].setup{}
--   end
-- end
--
-- setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
-- require'lspinstall'.post_install_hook = function ()
--   setup_servers() -- reload installed servers
--   vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
-- end

--vim.lsp.handlers["textDocument/definition"] = goto_definition('vsplit')
local lsp_signs = {
  DiagnosticSignHint = {
    -- text = icons.diagnostic.hint,
    text = "",
    texthl = "DiagnosticSignHint",
  },
  DiagnosticSignInfo = {
    -- text = icons.diagnostic.info,
    text = "",
    texthl = "DiagnosticSignInfo",
  },
  DiagnosticSignWarn = {
    -- text = icons.diagnostic.warning,
    text = "",
    texthl = "DiagnosticSignWarn",
  },
  DiagnosticSignError = {
    -- text = icons.diagnostic.error,
    text = "",
    texthl = "DiagnosticSignError",
  },
}

for hl_group, config in pairs(lsp_signs) do
  vim.fn.sign_define(hl_group, config)
end
