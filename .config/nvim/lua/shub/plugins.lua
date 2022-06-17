local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
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
        auto_clean = true,
	    compile_on_sync = true,
	    disable_commands = true,
	    git = { clone_timeout = 6000 },
	    display = {
		    working_sym = "ﲊ",
		    error_sym = "✗",
		    done_sym = "﫟",
		    removed_sym = "",
		    moved_sym = "",
            open_fn = function()
                return require('packer.util').float({ border = 'rounded' })
            end,
        }
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
--  use 'marko-cerovac/material.nvim'
    use 'bluz71/vim-moonfly-colors'
    use { 'akinsho/bufferline.nvim', disable = true, after = "nvim-web-devicons", config = "require('shub.config.bufferline')" }
    use { 'norcalli/nvim-colorizer.lua', config = "require('shub.config.colorizer')"}
    use { 'lukas-reineke/indent-blankline.nvim', config = "require('shub.config.indent-blankline')" }

    -- Status ba
    use { 'nvim-lualine/lualine.nvim', after = "nvim-web-devicons", config = "require('shub.config.lualine')" }

    -- cmp
    use 'hrsh7th/nvim-cmp'
    use {
            { 'hrsh7th/cmp-nvim-lsp' }, -- dont lazy load this
            { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
            { 'windwp/nvim-autopairs', after = "nvim-cmp", config = "require('shub.config.autopairs')" }
        }

    -- snippets
    use { 'L3MON4D3/LuaSnip' } --snippet engine
    use { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp'} -- LuaSnip completion sources
    use { 'rafamadriz/friendly-snippets', after = 'nvim-cmp'} -- a bunch of snippets to use

    -- LSP
    use 'neovim/nvim-lspconfig' -- enable LSP
    use 'williamboman/nvim-lsp-installer' -- simple to use language server installer
    use 'RRethy/vim-illuminate' -- hover highlights similar words
    use { "jose-elias-alvarez/null-ls.nvim", config = "require('shub.lsp.null-ls')" }  -- hook external sourcers into inbuilt lsp( for formatters, linters, etc)

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = "require('shub.config.treesitter')" }

    -- Navigation and fuzzy search
    use { 'kyazdani42/nvim-tree.lua', config = "require('shub.config.nvim-tree')" }
    use { 'nvim-telescope/telescope.nvim', config = "require('shub.config.telescope')" }
    use { 'nvim-telescope/telescope-media-files.nvim', after = telescope }
    use {
            'nvim-telescope/telescope-fzf-native.nvim',
            run = 'make',
         }

    -- QuickFix
    use { 'folke/trouble.nvim' }

    -- utils
    use { 'ggandor/lightspeed.nvim' } -- type 's' to search instead of '/'
    use { 'numToStr/Comment.nvim', config = "require('shub.config.comment')" }
    -- use { 'Djancyp/cheat-sheet' }
    use { 'RishabhRD/nvim-cheat.sh' }
    use { 'RishabhRD/popfix' }
--      'airblade/vim-rooter' -- activate when needed

    use {  'kyazdani42/nvim-web-devicons', after = "plenary.nvim", config = "require('shub.config.devicons')" }
    use { 'simrat39/symbols-outline.nvim', config =  "require('shub.config.symbols-outline')"}
    use { 'lewis6991/gitsigns.nvim', config = "require('shub.config.gitsigns')" }

    -- tpope
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'


    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
      require('packer').sync()
    end
end)
