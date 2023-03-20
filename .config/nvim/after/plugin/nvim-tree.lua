local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
  print("nvim-tree failed to load")
  return
end

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<c-n>", ":NvimTreeToggle<CR>", opts);
-- vim.keymap.set("n", "r", ":NvimTreeRefresh<CR>", opts);

-- :help nvim_tree_highlight
vim.cmd("highlight NvimTreeFolderIcon guibg=blue")

-- fix nvim tree coloring
vim.cmd("highlight NvimTreeBg guibg=None cterm=None")
vim.cmd('highlight! NvimTreeFolderIcon guibg=None ctermbg=None')

nvim_tree.setup({
    view = {
        width = 40,
        side = "left",
        number = false,
        relativenumber = true,
    },
    renderer = {
        highlight_git = false,
        full_name = false,
        icons = {
            padding = " ",
            symlink_arrow = " ➛ ",
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
            },
        },
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 400,
    },
    trash = {
        cmd = "gio trash",
        require_confirm = true,
    },
})
