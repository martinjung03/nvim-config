-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- search, find, navigate things
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- solarized color scheme
  use {
    'svrana/neosolarized.nvim',
    requires = { {'tjdevries/colorbuddy.nvim'} }
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
end)
