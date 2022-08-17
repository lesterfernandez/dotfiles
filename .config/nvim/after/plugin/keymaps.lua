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

-- fzf
-- vim.keymap.set("n", "<c-p>", ":Telescope find_files<CR>", opts);
vim.keymap.set("n", "<c-p>", ":Files <CR>", opts);
