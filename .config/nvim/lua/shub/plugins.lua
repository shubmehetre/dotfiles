local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer. Restart nvim'
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'rounded' })
        end,
    },
}

----------------------------------------------------
-----------------PLUGINS HERE-----------------------
----------------------------------------------------
return packer.startup(function(use)

    -- must have
    use 'lewis6991/impatient.nvim' -- Speed up loading Lua modules 
    use 'wbthomason/packer.nvim' -- Have packer manage itself
    use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim
    use 'nvim-lua/plenary.nvim' -- Useful lua functions used by lots of plugins

    -- Look n Feel
    use 'folke/tokyonight.nvim' -- theme
    use { 'akinsho/bufferline.nvim', event = "BufWinEnter", config = "require('shub.configs.bufferline')" }
--  use { 'norcalli/nvim-colorizer.lua', event = "BufRead", config = "require('shub.configs.colorizer')"}
    use { 'norcalli/nvim-colorizer.lua' }

    -- Status bar
    use { 'nvim-lualine/lualine.nvim', event = "BufWinEnter", config = "require('shub.configs.lualine')" }
    
    -- cmp
    use 'hrsh7th/nvim-cmp'
    use {
            { 'hrsh7th/cmp-nvim-lsp' }, -- dont lazy load this
            { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
        }

    -- snippets
    use { 'L3MON4D3/LuaSnip' } --snippet engine
    use { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp'} -- LuaSnip completion sources 
    use { 'rafamadriz/friendly-snippets', after = 'nvim-cmp'} -- a bunch of snippets to use

    -- LSP
    use 'neovim/nvim-lspconfig' -- enable LSP
    use 'williamboman/nvim-lsp-installer' -- simple to use language server installer
    use 'RRethy/vim-illuminate'

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', event = "BufWinEnter", config = "require('shub.configs.treesitter')" }
    use { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' }
  
    -- Navigation and fuzzy search
    use { 'kyazdani42/nvim-tree.lua', config = "require('shub.configs.nvim-tree')" }
    use { 'nvim-telescope/telescope.nvim', config = "require('shub.configs.telescope')" }
    use { 'nvim-telescope/telescope-media-files.nvim', after = telescope }

    -- utils
    use { 'ggandor/lightspeed.nvim' }
--      'airblade/vim-rooter' -- activate when needed

    use 'kyazdani42/nvim-web-devicons' -- dont lazy load this as well

    use { 'windwp/nvim-autopairs', event = "BufWinEnter", config = "require('shub.configs.autopairs')" }


    -- tpope
    use({
            'tpope/vim-surround',
            event = 'BufRead',
            requires = {
                { 'tpope/vim-repeat', event = 'BufRead' },
        },
    })

    use {
        'tpope/vim-commentary',
--      'tpope/vim-fugitive',
--      'tpope/vim-unimpaired',
        {
            'tpope/vim-sleuth',
            setup = function()
                vim.g.sleuth_automatic = 0
            end,
        },
    }


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
      require('packer').sync()
    end
end)
