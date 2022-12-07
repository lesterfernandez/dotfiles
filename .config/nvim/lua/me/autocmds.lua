local M = {}

M.formatGroup = vim.api.nvim_create_augroup("LSPFormatting", { clear = true });

vim.api.nvim_create_autocmd("BufWritePre", {
  command = "lua vim.lsp.buf.format()",
  group = M.formatGroup
})

return M
