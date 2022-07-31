local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

vim.api.nvim_create_autocmd("BufWritePre", {
  command = "autocmd BufWritePre * lua vim.lsp.buf.formatting_seq_sync()"
})

require "lsp.mason"
require "lsp.handlers".setup()
require "lsp.null-ls"
