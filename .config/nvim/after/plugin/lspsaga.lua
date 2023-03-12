local ok, saga = pcall(require, "lspsaga")
if not ok then
  print("lspsaga failed to load")
  return
end

saga.setup({
    ui = {
        title = false,
        border = "rounded"
    },
    symbol_in_winbar = {
        enable = false,
    },
    finder_action_keys = {
        open = "o",
        vsplit = "<c-v>",
        split = "<c-x>",
        tabe = "t",
        quit = "q",
        scroll_down = "<C-f>",
        scroll_up = "<C-b>",
    },
    code_action_keys = {
        quit = "q",
        exec = "<CR>",
    },
    rename = {
        quit = "<C-[>",
        exec = "<CR>",
        mark = "x",
        confirm = "<CR>",
        in_select = true,
    },
})
