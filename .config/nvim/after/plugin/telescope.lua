-- require('telescope').setup {
--   defaults = {
--     -- Default configuration for telescope goes here:
--     -- config_key = value,
--     -- ..
--     -- layout_strategy = "vertical",
--     layout_config = { height = 0.5, width = 0.6 },
--     -- layout_config = {
--     --   vertical = { width = 0.9 }
--     --   -- other layout configuration here
--     -- },
--     mappings = {
--       i = {
--         ["<C-s>"] = require("telescope.actions").select_horizontal,
--       }
--     },
--     -- borderchars = {
--     --   prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
--     --   results = { " " },
--     --   preview = { " " },
--     -- },
--   },
--   pickers = {
--     -- find_files = {
--     --   theme = "dropdown",
--     -- }
--     -- Default configuration for builtin pickers goes here:
--     -- picker_name = {
--     --   picker_config_key = value,
--     --   ...
--     -- }
--     -- Now the picker_config_key will be applied every time you call this
--     -- builtin picker
--   },
--   extensions = {
--     -- Your extension configuration goes here:
--     -- extension_name = {
--     --   extension_config_key = value,
--     -- }
--     -- please take a look at the readme of the extension you want to configure
--   }
-- }
-- require('telescope').load_extension('fzf')
