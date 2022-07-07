-- local null_ls_status_ok, null_ls = pcall(require, "null_ls")
-- if not null_ls_status_ok then
--   return
-- end

local null_ls = require "null-ls"
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  diagnostics_format = "#{m}",
  sources = {
    diagnostics.eslint_d,
    formatting.prettier_d_slim
  }
})
