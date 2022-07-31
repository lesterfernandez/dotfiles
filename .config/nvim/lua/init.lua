require "lsp.init"
require "me.treesitter"
require "me.nvim-cmp"
require "me.nvim-tree-config"

local status, autotag = pcall(require, "nvim-ts-autotag")
if (not status) then return end
autotag.setup({})

require("luasnip.loaders.from_vscode").load({ paths = "./snippets" })
