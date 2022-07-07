require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "c",
    "cpp",
    "dockerfile",
    "prisma",
    "python",
    "javascript",
    "typescript",
    "lua",
    "tsx",
    "fish",
    "bash",
    "go",
    "rust",
    "java",
    "json",
    "html",
    "css",
    "scss",
    "yaml",
    "graphql"
  },
  autopairs = {
    enable = true
  },
  autotag = {
    enable = true
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
