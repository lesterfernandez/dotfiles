" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " LSP and TreeSitter
    Plug 'neovim/nvim-lspconfig'
    Plug 'WhoIsSethDaniel/mason-tool-installer.nvim'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'JoosepAlviste/nvim-ts-context-commentstring'
    Plug 'windwp/nvim-ts-autotag'
    Plug 'windwp/nvim-autopairs'

    " Nvim cmp
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'

    " Look and feel
    Plug 'morhetz/gruvbox'
    Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}
    " Plug 'sainnhe/gruvbox-material'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    
    " Utils
    Plug 'nvim-lua/plenary.nvim'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Plug 'nvim-telescope/telescope.nvim' 
    " Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'tpope/vim-surround'
    Plug 'preservim/nerdcommenter'
    Plug 'pantharshit00/vim-prisma'
    Plug 'PeterRincker/vim-searchlight'
    Plug 'lewis6991/gitsigns.nvim'

    " Snippets
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'

call plug#end()
