-- KEYMAPS
-- See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

-- Emacs/getlines style navigation in command line mode
vim.keymap.set("c", "<M-b>", "<S-Left>")
vim.keymap.set("c", "<M-f>", "<S-Right>")

-- toggle quickfix window
vim.keymap.set("n", "<leader>q", function()
    -- Check if a quickfix window is open anywhere in the current tab
    local qf_exists = false
    for _, win in ipairs(vim.fn.getwininfo()) do
        if win.quickfix == 1 then
            qf_exists = true
            break
        end
    end
    -- Toggle accordingly
    if qf_exists then
        vim.cmd("cclose")
    else
        vim.cmd("copen")
    end
end)

-- Set noop mapping to avoid sending digraph key to neovim engine (conflicts with signature help)
vim.keymap.set({ "n", "i" }, "<C-k>", "<Nop>", { silent = true })

-- Disable using K for :help (confusing when I expect lsp to be working)
vim.keymap.set("n", "K", "<Nop>", { silent = true })

-- Map Esc and Ctrl-[ to close all floating windows
local close_hovers = function()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local config = vim.api.nvim_win_get_config(win)
        if config.relative ~= "" then -- Check if the window is floating
            vim.api.nvim_win_close(win, false)
        end
    end
end
vim.keymap.set("n", "<Esc>", close_hovers)
vim.keymap.set("n", "<C-[>", close_hovers)

-- Go to next/prev diagnostic
vim.keymap.set("n", "[d", function()
    vim.diagnostic.goto_prev({ float = { focusable = true } })
end, opts)
vim.keymap.set("n", "]d", function()
    vim.diagnostic.goto_next({ float = { focusable = true } })
end, opts)
