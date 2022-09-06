local opts = { noremap = true, silent = true }
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
