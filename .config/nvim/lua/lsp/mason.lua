local servers = {
  "lua_ls",
  "html",
  "tsserver",
  "emmet_ls",
  "clangd",
  "cssls",
  "gopls",
  "pyright",
  "jsonls",
  "prismals",
  "tailwindcss",
  "astro"
}

local tools = {
  "prettierd",
  "black",
  "eslint_d",
  "cpptools",
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

require("mason-tool-installer").setup {
  ensure_installed = tools,
  auto_update = true,
  run_on_start = true -- or :MasonToolsUpdate
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
