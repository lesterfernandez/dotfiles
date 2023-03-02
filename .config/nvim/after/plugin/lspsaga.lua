local ok, saga = pcall(require, "lspsaga")
if not ok then
  print("lspsaga did not load")
  return
end

-- change the lsp symbol kind
-- local kind = require('lspsaga.lspkind')
-- kind[type_number][2] = icon

vim.cmd("highlight LspSagaCodeActionBorder guifg='#E7D7AD'")
vim.cmd("highlight LspSagaCodeActionContent guifg='#ebdbb2' gui='none'")
vim.cmd("highlight LspSagaCodeActionTitle guifg='#ebdbb2' gui='bold'")
vim.cmd("highlight LspSagaRenameBorder guifg='#E7D7AD'")
vim.cmd("highlight LspSagaHoverBorder guifg='#E7D7AD'")
vim.cmd("highlight LspSagaSignatureHelpBorder guifg='#E7D7AD'")
vim.cmd("highlight LspSagaDefPreviewBorder guifg='#E7D7AD'")

saga.setup({
  -- "single" | "double" | "rounded" | "bold" | "plus"
  border_style = "rounded",
  -- range 0 - 100 of transparency
  saga_winblend = 0,
  -- when cursor in saga window you config these to move
  move_in_saga = { prev = '<C-p>', next = '<C-n>' },
  -- Error, Warn, Info, Hint
  diagnostic_header = { " ", " ", " ", "ﴞ " },
  -- preview lines of lsp_finder and definition preview
  max_preview_lines = 10,
  -- use emoji lightbulb in default
  code_action_icon = "💡",
  -- if true can press number to execute the codeaction in codeaction window
  code_action_num_shortcut = true,
  -- same as nvim-lightbulb but async
  code_action_lightbulb = {
    enable = false,
    sign = true,
    enable_in_insert = true,
    sign_priority = 20,
    virtual_text = false,
  },
  -- finder icons
  finder_icons = {
    def = '  ',
    ref = '諭 ',
    link = '  ',
  },
  -- finder do lsp request timeout
  -- if your project big enough or your server very slow
  -- you may need to increase this value
  finder_request_timeout = 1500,
  finder_action_keys = {
    open = "o",
    vsplit = "<c-v>",
    split = "<c-x>",
    tabe = "t",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>", -- quit can be a table
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  rename_action_quit = "<C-c>",
  rename_in_select = true,
  -- show outline
  show_outline = {
    win_position = 'right',
    -- set special filetype win that outline window split.like NvimTree neotree
    -- defx, db_ui
    win_with = '',
    win_width = 30,
    auto_enter = true,
    auto_preview = true,
    virt_text = '┃',
    jump_key = 'o',
    -- auto refresh when change buffer
    auto_refresh = true,
  },
  -- custom lsp kind
  -- { Field = 'color code'} or {Field = {your icon, your color code}}
  custom_kind = {},
})
