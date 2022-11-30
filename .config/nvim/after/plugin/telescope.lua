local ok, telescope = pcall(require, "telescope")
if not ok then
  print("telescope failed to load")
  return
end

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<c-p>", ":Telescope find_files<CR>", opts);
vim.api.nvim_set_keymap("n", "<C-p>", "<CMD>lua require'telescope.builtin'.find_files(opts) <CR>",
  { noremap = true, silent = true })
vim.api.nvim_create_user_command("LiveGrep", "lua require'telescope.builtin'.live_grep(opts) <CR>", {})

telescope.setup {
  defaults = {
    file_ignore_patterns = { "node_modules" },
    layout_strategy = "center",
    layout_config = { height = 0.7, width = 0.8 },
    mappings = {
      i = {
        ["<C-s>"] = require("telescope.actions").select_horizontal,
      }
    },
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case",
    }
  }
  -- borderchars = {
  --   prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
  --   results = { " " },
  --   preview = { " " },
  -- },
  -- picker_name = {
  --   picker_config_key = value,
  --   ...
  -- }
  -- Now the picker_config_key will be applied every time you call this
  -- builtin picker
}

telescope.load_extension('fzf')
