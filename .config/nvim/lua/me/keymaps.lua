local opts = { silent = true }
vim.keymap.set("i", "jk", "<ESC>", opts);
vim.keymap.set("n", "<leader>,", ",", opts);
vim.keymap.set("n", "<c-k>", "<c-w><c-k>", opts);
vim.keymap.set("n", "<c-l>", "<c-w><c-l>", opts);
vim.keymap.set("n", "<c-h>", "<c-w><c-h>", opts);
vim.keymap.set("n", "<c-j>", "<c-w><c-j>", opts);
vim.keymap.set("n", "<leader>-", ":resize -3<CR>", opts);
vim.keymap.set("n", "<leader>+", ":resize +3<CR>", opts);
vim.keymap.set("n", "<leader>>", ":vertical resize +3<CR>", opts);
vim.keymap.set("n", "<leader><", ":vertical resize -3<CR>", opts);
vim.keymap.set("n", "<CR>", ":noh<CR>", opts);
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)

vim.keymap.set("n", "[b", ":bnext<CR>", opts)
vim.keymap.set("n", "]b", ":bprevious<CR>", opts)
