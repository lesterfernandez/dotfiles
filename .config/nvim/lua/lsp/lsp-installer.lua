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
  ensure_installed = servers,
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

local lspconfig = require "lspconfig"

for _, server in pairs(servers) do
  local opts = {
    on_attach = require "lsp.handlers".on_attach,
    capabilities = require "lsp.handlers".capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end

  lspconfig[server].setup(opts);
end
