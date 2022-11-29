local ok, lualine = pcall(require, "lualine")
if not ok then
  print("lualine did not load")
  return
end

local custom_gruvbox = require("lualine.themes.gruvbox")
-- make normal mode and command mode have same colors
custom_gruvbox.command = vim.deepcopy(custom_gruvbox.normal)

lualine.setup {
  options = {
    icons_enabled = true,
    theme = custom_gruvbox,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    -- lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_x = { 'encoding', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
