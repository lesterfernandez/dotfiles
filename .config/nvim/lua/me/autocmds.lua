local formatGroup = vim.api.nvim_create_augroup("Format", { clear = true });

vim.api.nvim_create_autocmd("BufWritePre", {
  command = "lua vim.lsp.buf.formatting_seq_sync()",
  group = formatGroup
})
