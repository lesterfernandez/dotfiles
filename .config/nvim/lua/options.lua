-- OPTIONS
-- For more options, you can see `:h option-list`, or `:h 'optionname'`
-- See `:h mapleader`
vim.g.mapleader = "\\"
vim.o.number = true -- absolute line numbers
vim.o.relativenumber = true -- relative line numbers
vim.o.ignorecase = true -- ignore case in search
vim.o.smartcase = true -- unless there's a capital letter in it
vim.o.hlsearch = false -- disable highlight search
vim.o.incsearch = true -- enable highlight while searching
vim.o.scrolloff = 5 -- scroll offset
vim.o.confirm = true -- confirm before quitting unsaved buffer
vim.o.mouse = "" -- disable mouse
vim.o.signcolumn = "yes" -- always have sign column to avoid jitter
vim.o.termguicolors = false
-- TAB SETTINGS
-- Useful command: :set ts? sts? sw? et?
vim.o.shiftwidth = 4 -- cindent, <<, >>
vim.o.softtabstop = -1 -- customize width of <Tab> and <BS>, -1 sets to 'sw'
vim.o.expandtab = true -- no tabs, also disables conversion of spaces to tabs
-- Window / popup settings
vim.o.winborder = "single" -- Options: "single", "double", "rounded", "solid", "shadow"
vim.o.pumborder = "single"
vim.o.completeopt = "fuzzy,menuone,noselect,noinsert,popup"
vim.o.complete = "o" -- only omnifunc powered completion (LSP hooks into this)
vim.o.pumheight = 10 -- prevent super long popups
