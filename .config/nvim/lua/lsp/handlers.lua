local M = {}

M.setup = function()
  local config = {
    virtual_text = false,
    update_in_insert = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    }
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signature_help"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      spacing = 2,
      prefix = '',
      severity_limit = "Warning"
    }
  }
  )
end

local function setLSPKeymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>qf', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
end

local disable_formatting = {
  ["tsserver"] = true,
  ["html"] = true
}

M.on_attach = function(client, bufnr)
  if disable_formatting[client.name] then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end

  if client.name == "tsserver" then
    local tsserverGroup = vim.api.nvim_create_augroup("TSServer", { clear = true });
    vim.api.nvim_create_autocmd("BufWritePre", {
      command = "lua vim.lsp.buf.execute_command({command = \"_typescript.organizeImports\", arguments = {vim.fn.expand(\"%:p\")}})",
      group = tsserverGroup
    })
  end

  setLSPKeymaps(bufnr)
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local status_cmp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_cmp_ok then
  return
end

M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

return M
