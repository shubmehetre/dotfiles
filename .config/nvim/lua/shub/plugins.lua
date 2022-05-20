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

    -- Looks
    use 'folke/tokyonight.nvim' -- theme
    use ({
        'akinsho/bufferline.nvim', 
        config = function()
            require('shub.configs.colorizer')
        end,
    })
    use ({
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('shub.configs.colorizer')
        end,
    })
    -- cmp
    use ({
        { 
            'hrsh7th/nvim-cmp',
--          event = 'InsertEnter',
            config = function()
                require('shub.cmp')
            end,
        },
        {
            { 'hrsh7th/cmp-nvim-lsp' }, -- dont lazy load this
            { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
        },
    })

    -- snippets
    use 'L3MON4D3/LuaSnip' --snippet engine
    use 'saadparwaiz1/cmp_luasnip' -- LuaSnip completion sources 
    use 'rafamadriz/friendly-snippets' -- a bunch of snippets to use

    -- LSP
    use 'neovim/nvim-lspconfig' -- enable LSP
    use 'williamboman/nvim-lsp-installer' -- simple to use language server installer

    -- treesitter
    use({
        {
            'nvim-treesitter/nvim-treesitter',
            event = 'CursorHold',
            run = ':TSUpdate',
            config = function()
                require('shub.configs.treesitter')
            end,
        },
        { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' },
    })
  
    -- Navigation and fuzzy search
    use({
            'kyazdani42/nvim-tree.lua',
            event = 'CursorHold',
            config = function()
                require('shub.configs.nvim-tree')
            end,
    })

    use ({
        {
            'nvim-telescope/telescope.nvim',
            event = 'CursorHold',
            config = function()
                require('shub.configs.telescope')
            end,
        },
        { 'nvim-telescope/telescope-media-files.nvim', after = telescope },
    })

    -- utils
    use ({
            'ggandor/lightspeed.nvim',
--      { 'windwp/nvim-autopairs', config = function() require('shub.configs.autopairs') } ,
--      'airblade/vim-rooter' -- activate when needed
    })

    use({
            'kyazdani42/nvim-web-devicons',
            opt = true,
            config = function()
                require('nvim-web-devicons').setup()
            end,
    })

    use({
            'windwp/nvim-autopairs',
            event = 'InsertCharPre',
            after = 'nvim-cmp',
            config = function()
                require('shub.configs.autopairs')
            end,
    })


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
