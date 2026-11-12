-- AUTOCOMMANDS (EVENT HANDLERS)
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`

custom_autocmd_group = vim.api.nvim_create_augroup("CustomAutocmd", { clear = true })

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    group = custom_autocmd_group,
    desc = "Highlight when yanking (copying) text",
    callback = function()
        vim.hl.on_yank({ timeout = 50 })
    end,
})

-- Auto open quickfix after a find, grep, or make
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
    group = custom_autocmd_group,
    pattern = [=[[^l]*]=], -- Runs for cexpr/grep/make, but ignores lexpr/lgrep (location lists)
    callback = function()
        vim.cmd("cwindow") -- Opens quickfix only if there are valid errors/matches
    end,
})

-- Force relative path if buffer opens a file under the current working directory
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    group = custom_autocmd_group,
    callback = function()
        local bufname = vim.api.nvim_buf_get_name(0)
        local cwd = vim.fn.getcwd()
        -- Only rewrite if it's an absolute path AND starts with CWD path
        if bufname:match("^/") and bufname:sub(1, #cwd) == cwd then
            vim.api.nvim_buf_set_name(0, vim.fn.fnamemodify(bufname, ":."))
        end
    end,
})

-- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#format-command
vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
        }
    end
    require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })
