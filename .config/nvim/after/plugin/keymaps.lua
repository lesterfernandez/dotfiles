local opts = { noremap = true, silent = true }

-- nvimtree
-- :help nvim_tree_highlight
-- highlight NvimTreeFolderIcon guibg=blue
-- fix nvim tree coloring
-- highlight NvimTreeBg guibg=None cterm=None
-- highlight! NvimTreeFolderIcon guibg=None ctermbg=None

vim.keymap.set("n", "<c-n>", ":NvimTreeToggle<CR>", opts);
-- vim.keymap.set("n", "r", ":NvimTreeRefresh<CR>", opts);
-- vim.keymap.set("n", "<leader>n", ":NvimTreeFindFile<CR>", opts);

vim.keymap.set("n", "<c-p>", ":Telescope find_files<CR>", opts);

-- require "me.telescope-config".project_files()
vim.api.nvim_set_keymap("n", "<C-p>", "<CMD>lua require'telescope.builtin'.find_files(opts) <CR>",
  { noremap = true, silent = true })

vim.api.nvim_create_user_command("LiveGrep", "lua require'telescope.builtin'.live_grep(opts) <CR>", {})
