-- See `:h mapleader`
vim.g.mapleader = "\\"

-- OPTIONS
-- See `:h vim.o`
-- For more options, you can see `:h option-list`, or `:h 'optionname'`
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
-- Default tab settings. Spaces with width 4
vim.o.expandtab = true -- tab inserts spaces
vim.o.tabstop = 4 -- default tab to 4 columns
vim.o.shiftwidth = 4 -- columns used for auto indentation (>>, <<, etc)
-- Window / popup settings
vim.o.winborder = "single" -- Options: "single", "double", "rounded", "solid", "shadow"
vim.o.pumborder = "single"
vim.o.completeopt = "fuzzy,menuone,noselect,noinsert,popup"
vim.o.complete = "o" -- only omnifunc powered completion (LSP hooks into this)
vim.o.pumheight = 10 -- prevent super long popups
-- Path for :find :grep
vim.opt.path:append("**")
vim.opt.wildignore:append({ "**/node_modules/**", "**/.git/**", "**/build/**" })

-- KEYMAPS
-- See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`
-- Use <Esc> to exit terminal mode
-- Emacs/shell style navigation in command line mode
vim.keymap.set("c", "<M-b>", "<S-Left>")
vim.keymap.set("c", "<M-f>", "<S-Right>")
-- toggle quickfix window
vim.keymap.set("n", "<leader>q", function()
	-- Check if a quickfix window is open anywhere in the current tab
	local qf_exists = false
	for _, win in ipairs(vim.fn.getwininfo()) do
		if win.quickfix == 1 then
			qf_exists = true
			break
		end
	end
	-- Toggle accordingly
	if qf_exists then
		vim.cmd("cclose")
	else
		vim.cmd("copen")
	end
end)

-- AUTOCOMMANDS (EVENT HANDLERS)
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`
-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.hl.on_yank({ timeout = 50 })
	end,
})
-- Auto open quickfix after a find, grep, or make
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
	group = vim.api.nvim_create_augroup("AutoOpenQuickfix", { clear = true }),
	pattern = [=[[^l]*]=], -- Runs for cexpr/grep/make, but ignores lexpr/lgrep (location lists)
	callback = function()
		vim.cmd("cwindow") -- Opens quickfix only if there are valid errors/matches
	end,
})

-- TAB SETTINGS
-- See `:h nvim_create_user_command()` and `:h user-commands`
local tab_group = vim.api.nvim_create_augroup("TabSettings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = tab_group,
	pattern = { "javascript", "typescript", "html", "css", "lua" },
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.tabstop = 2 -- tab insert width
		vim.opt_local.shiftwidth = 2 -- auto indent width
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	group = tab_group,
	pattern = { "go", "makefile" },
	callback = function()
		vim.opt_local.expandtab = false
		vim.opt_local.tabstop = 4 -- tab insert width
		vim.opt_local.shiftwidth = 4 -- auto indent width
	end,
})

-- LSP-RELATED SETTINGS
-- Set noop mapping to avoid sending digraph key to neovim engine (conflicts with signature help)
vim.keymap.set({ "n", "i" }, "<C-k>", "<Nop>", { silent = true })
-- Disable using K for :help
vim.keymap.set("n", "K", "<Nop>", { silent = true })
-- Function to close all floating windows
local close_hovers = function()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local config = vim.api.nvim_win_get_config(win)
		if config.relative ~= "" then -- Check if the window is floating
			vim.api.nvim_win_close(win, false)
		end
	end
end
-- Map Esc and Ctrl-[ to close the floating windows
vim.keymap.set("n", "<Esc>", close_hovers)
vim.keymap.set("n", "<C-[>", close_hovers)
vim.diagnostic.config({
	virtual_text = false, -- Disable inline virtual text
	virtual_lines = false, -- Disable underline virtual lines
	underline = true, -- Keep syntax error underlining
	severity_sort = true,
})
-- Go to next/prev diagnostic
vim.keymap.set("n", "[d", function()
	vim.diagnostic.goto_prev({ float = { focusable = true } })
end, opts)
vim.keymap.set("n", "]d", function()
	vim.diagnostic.goto_next({ float = { focusable = true } })
end, opts)
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(event)
		local client_id = event.data.client_id
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buf = event.buf }) -- needs to be re-applied because of previous noop
		vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, { buf = event.buf })
		-- Completion
		vim.lsp.completion.enable(true, client_id, event.buf, {
			autotrigger = true, -- let LSP decide when to trigger popup
		})
	end,
})

vim.cmd.colorscheme("min")

-- PLUGINS
-- See `:h :packadd`, `:h vim.pack`
-- Add the "nohlsearch" package to automatically disable search highlighting
vim.cmd("packadd! nohlsearch")
vim.pack.add({
	-- handle installing parsers
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
	-- Quickstart configs for LSP
	"https://github.com/neovim/nvim-lspconfig",
	-- Git integration
	"https://github.com/lewis6991/gitsigns.nvim",
	-- Manage LSP server installs
	"https://github.com/mason-org/mason.nvim",
	-- Surround
	"https://github.com/kylechui/nvim-surround",
	-- Formatter
	"https://github.com/stevearc/conform.nvim",
})

-- PLUGIN SETTINGS
require("gitsigns").setup({})
-- Disable snippets
vim.lsp.config("*", {
	capabilities = {
		textDocument = { completion = { completionItem = { snippetSupport = false } } },
	},
})
-- Enable LSP
vim.lsp.enable({
	"pyright",
	"ts_ls",
	"clangd",
	"gopls",
	"rust_analyzer",
	"dockerls",
	"bashls",
})
require("mason").setup()
-- Setup Treesitter
require("nvim-treesitter").setup()
require("nvim-treesitter").install({
	"python",
	"typescript",
	"javascript",
	"c",
	"cpp",
	"go",
	"rust",
	"dockerfile",
	"bash",
})
-- Setup formatter
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		python = { "black" },
		c = { "clang-format" },
		cpp = { "clang-format" },
	},
})
-- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#format-command
vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })
