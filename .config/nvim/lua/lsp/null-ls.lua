local null_ls = require "null-ls"
local builtins = null_ls.builtins

null_ls.setup({
  diagnostics_format = "#{m} (#{s})",
  sources = {
    builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ ".eslintrc", ".eslintrc.json", ".eslintrc.js", ".eslintrc.cjs" })
      end
    }),
    builtins.formatting.prettierd
  }
})
