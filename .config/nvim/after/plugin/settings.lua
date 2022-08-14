-- nerd commenter
vim.g.NERDSpaceDelims = 1
vim.g.NERDDefaultAlign = 'left'

-- fzf
vim.env.FZF_DEFAULT_COMMAND = "find . \\( -name node_modules -o -name .git \\) -prune -o -print"
