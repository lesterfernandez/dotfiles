-- local null_ls_status_ok, null_ls = pcall(require, "null_ls")
-- if not null_ls_status_ok then
--   return
-- end

local null_ls = require "null-ls"
local builtins = null_ls.builtins
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
-- local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  diagnostics_format = "#{m} (#{s})",
  sources = {
    builtins.diagnostics.eslint_d.with({
      prefer_local = "node_modules/.bin",
    }),
    builtins.formatting.prettier_d_slim
    -- builtins.formatting.prettierd
  }
})
