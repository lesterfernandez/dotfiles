local options = {
  -- look & feel
  number = true,
  relativenumber = true,
  scrolloff = 7,
  colorcolumn = "80",
  hlsearch = true,

  -- indentation,
  autoindent = true, -- copy indent from last line when inserting new line
  smartindent = true, -- indent in braces and other things
  smarttab = true, -- insert tabs with shiftwidth value
  tabstop = 2, -- tab size
  shiftwidth = 2, -- indentation size
  expandtab = true, -- replace tabs with spaces

  -- functionality,
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  incsearch = true,
  ignorecase = true,
  lazyredraw = true,
  hidden = true,
  termguicolors = true, -- this makes colors work properly
  showmode = false, -- don't show text displaying mode (lualine replaces this)
  shell = "/bin/bash",
  inccommand = "nosplit",
  swapfile = false,
  wrap = false,
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  clipboard = "unnamedplus"
}

vim.opt.shortmess:append "c"
vim.g.mapleader = ","

for k, v in pairs(options) do
  vim.opt[k] = v
end
