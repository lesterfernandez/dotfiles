require "me.settings"
require "me.autocmds"
require "lsp.init"
require "me.treesitter"
require "me.nvim-cmp"
require "me.nvim-tree-config"
require "me.git-signs"

require "nvim-ts-autotag".setup({})

require "luasnip.loaders.from_vscode".load({ paths = "./snippets" })
