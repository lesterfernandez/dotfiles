local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- local opts = { noremap = true, silent = true }

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
-- local completion = null_ls.builtins.completion
-- local hover = null_ls.builtins.hover
-- local code_actions = null_ls.builtins.code_actions


null_ls.setup({
  diagnostics_format = "#{m} (#{s})",
  sources = {
    formatting.prettierd,
    diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ ".eslintrc", ".eslintrc.json", ".eslintrc.js", ".eslintrc.cjs" })
      end
    }),
  }
})
