require("options")
require("keymaps")
require("cmd")
require("lsp")

vim.cmd.colorscheme("min")

vim.diagnostic.config({
    virtual_text = false, -- Disable inline virtual text
    virtual_lines = false, -- Disable underline virtual lines
    underline = true, -- Keep syntax error underlining
    severity_sort = true,
})

-- PLUGINS
-- See `:h :packadd`, `:h vim.pack`
vim.cmd("packadd! nohlsearch") -- built in plugin to automatically disable search highlight
vim.pack.add({
    -- Quickstart configs for LSP
    "https://github.com/neovim/nvim-lspconfig",
    -- Git integration
    "https://github.com/lewis6991/gitsigns.nvim",
    -- Manage LSP server installs
    "https://github.com/mason-org/mason.nvim",
    -- Surround
    "https://github.com/kylechui/nvim-surround",
    -- Formatter
    "https://github.com/stevearc/conform.nvim",
})

require("mason").setup() -- setup required
-- Note: These binaries must be installed with Mason.
require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        python = { "black" },
        c = { "clang-format" },
        cpp = { "clang-format" },
    },
})

