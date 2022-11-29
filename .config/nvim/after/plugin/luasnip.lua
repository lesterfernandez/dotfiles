local ok, luasnip_vscode_loader = pcall(require, "luasnip.loaders.from_vscode")
if not ok then
  print("nvim-autopairs failed to load")
  return
end

luasnip_vscode_loader.load({ paths = "./snippets" })

local opts = { noremap = true, silent = true }
-- " press <Tab> to expand or jump in a snippet. These can also be mapped separately
-- " via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
vim.keymap.set("i", "<silent><expr><Tab>", "luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'")
vim.keymap.set("i", "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<Cr>", opts)
vim.keymap.set("s", "<Tab>", "<cmd>lua require('luasnip').jump(1)<Cr>", opts)
vim.keymap.set("s", "<S-Tab>", "<cmd>lua require('luasnip').jump(-1)<Cr>", opts)
