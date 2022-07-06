require("me.nvim-treesitter")
require("me.nvim-lsp-installer-config")
require("me.nvim-lspconfig")
require("me.nvim-cmp")
require("me.nvim-tree-config")

local status, autotag = pcall(require, "nvim-ts-autotag")
if (not status) then return end
autotag.setup({})
