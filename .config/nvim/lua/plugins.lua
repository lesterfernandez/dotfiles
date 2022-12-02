local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  -- LSP
  use { "neovim/nvim-lspconfig", requires = { {
    "williamboman/mason.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "williamboman/mason-lspconfig.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "glepnir/lspsaga.nvim"
  } } }

  --- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate",
    requires = { {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "windwp/nvim-ts-autotag",
      "windwp/nvim-autopairs",
      "yioneko/nvim-yati" -- Temporary
    } } }

  -- Nvim cmp
  use { "hrsh7th/nvim-cmp", requires = { {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip"
  } } }

  -- -- Look and feel
  use { "morhetz/gruvbox",
    requires = {
      { "nvim-lualine/lualine.nvim" },
      { "kyazdani42/nvim-web-devicons" } --for file icons,
    }
  }
  use { "luisiacc/gruvbox-baby", branch = "main" }

  -- Utils
  use "nvim-lua/plenary.nvim"
  use "kyazdani42/nvim-tree.lua"
  use {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    }
  }
  use "tpope/vim-surround"
  use "preservim/nerdcommenter"
  use "PeterRincker/vim-searchlight"
  use "lewis6991/gitsigns.nvim"
  use "mfussenegger/nvim-dap"
  use { "iamcco/markdown-preview.nvim", run = "cd app && yarn install" }

  --Snippets
  use "L3MON4D3/LuaSnip"

  if packer_bootstrap then
    require("packer").sync()
  end
end)
