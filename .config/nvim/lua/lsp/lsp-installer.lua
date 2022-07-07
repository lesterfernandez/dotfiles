local servers = {
  "sumneko_lua",
  "html",
  "graphql",
  "tsserver",
  "dockerls",
  "emmet_ls",
  "marksman",
  "jsonls",
  "clangd",
  "cssls",
  "gopls",
  "pyright",
  "tailwindcss",
  "prismals",
}

require("nvim-lsp-installer").setup({
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

for _, server in pairs(servers) do
  local opts = {
    on_attach = require "lsp.handlers".on_attach,
    capabilities = require "lsp.handlers".capabilities
  }

  if server == "sumneko_lua" then
    local sumneko_opts = require "lsp.settings.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  lspconfig[server].setup(opts);
end
