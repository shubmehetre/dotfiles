local status_ok, ts = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

ts.setup {
  ensure_installed = { "c", "python", "cpp"},
  sync_install = false,
  auto_install = true,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml", "python"  } }
}

-- ts test
-- Need=> use { 'p00f/nvim-ts-test', after = 'nvim-treesitter' }
-- require("nvim-treesitter.configs").setup {
--     highlight = {
--   },
--   test =
--     {
--         enable = true,
--         -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
--         extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
--         max_file_lines = nil, -- Do not enable for files with more than n lines, int
--         -- colors = {}, -- table of hex strings
--         -- termcolors = {} -- table of colour name strings
--     }
-- }
