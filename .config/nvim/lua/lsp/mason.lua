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
  "jdtls"
}

local tools = {
  "prettierd",
  "eslint_d",
  "cpptools"
}

require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup {
  ensure_installed = servers,
  automatic_installation = true,
}

require 'mason-tool-installer'.setup {
  ensure_installed = tools,
  auto_update = false,
  run_on_start = false -- use :MasonToolsUpdate instead
}

local lspconfig = require "lspconfig"

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end

  lspconfig[server].setup(opts);
end
