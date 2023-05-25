-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- better escape
  use 'max397574/better-escape.nvim'

  -- search, find, navigate things
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- solarized color scheme
  use {
    'svrana/neosolarized.nvim',
    requires = { { 'tjdevries/colorbuddy.nvim' } }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- useful undo history
  -- lazy load when the command executes
  use { 'mbbill/undotree', opt = true, cmd = 'UndotreeToggle' }

  -- git
  -- lazy load when the command executes
  use { 'kdheepak/lazygit.nvim', opt = true, cmd = 'LazyGit' }

  -- LSP !
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  }

  -- snippet
  use { "rafamadriz/friendly-snippets" }
  --  use { "mattn/emmet-vim" }

  -- null ls
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })
end)
