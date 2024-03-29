local M = {}

M.setup = function()
  vim.diagnostic.config({
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
  })

  -- configure default handlers
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
          border = "rounded",
      })
  vim.lsp.handlers["textDocument/signature_help"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
          border = "rounded",
      })
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
          vim.lsp.diagnostic.on_publish_diagnostics, {
          virtual_text = {
              severity_limit = "Warning"
          }
      })

  local has_telescope_builtins, telescope_builtins = pcall(require, "telescope.builtin")
  if has_telescope_builtins then
    vim.lsp.handlers["textDocument/references"] = telescope_builtins.lsp_references
  end
end

local function setLSPKeymaps(bufnr, client)
  local opts = { noremap = true, silent = true }
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>qf", vim.lsp.buf.code_action, bufopts)

  if client.server_capabilities.hoverProvider then
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  end
  if client.server_capabilities.signatureHelpProvider then
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
  end

  local has_saga, _ = pcall(require, "lspsaga")
  if has_saga then
    vim.keymap.set("n", "<leader>qf", "<cmd>Lspsaga code_action<CR>", bufopts)
    vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)
    vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", bufopts)
  end
end

M.on_attach = function(client, bufnr)
  local disable_formatting = {
      ["tsserver"] = true,
      ["html"] = true
  }
  if disable_formatting[client.name] then
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end

  setLSPKeymaps(bufnr, client)
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = require("cmp_nvim_lsp").default_capabilities(M.capabilities)

return M
