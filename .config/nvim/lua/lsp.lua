-- LSP Settings

-- Configure LSP completions and setup keymaps.
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
    callback = function(event)
        local client_id = event.data.client_id
        -- needs to be re-applied because of previous noop
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buf = event.buf })
        vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, { buf = event.buf })
        -- Enable LSP-powered completion
        vim.lsp.completion.enable(true, client_id, event.buf, {
            autotrigger = false, -- do not let LSP decide when to trigger popup
        })
    end,
})

-- Try to disable snippets.
vim.lsp.config("*", {
    capabilities = {
        textDocument = { completion = { completionItem = { snippetSupport = false } } },
    },
})

-- Enable LSP servers. Note: These must be installed with Mason.
vim.lsp.enable({
    "pyright",
    "ts_ls",
    "clangd",
    "gopls",
    "rust_analyzer",
    "dockerls",
    "bashls",
})

