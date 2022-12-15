local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
  print("nvim-treesitter.config failed to load")
  return
end

treesitter.setup {
  highlight = {
    enable = true,
    disable = { "html" },
  },
  indent = {
    enable = true,
    disable = { "cpp", "c", "tsx", "jsx", "python", "javascript",
      "typescript", "rust", "html", "lua",
      "markdown", "vim", "yaml", "json" },
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
    "graphql",
    "vim"
  },
  autopairs = {
    enable = true,
  },
  autotag = {
    enable = true
  },
  context_commentstring = {
    enable = false
  },
  yati = { enable = true, disable = { "graphql" } },
}

local ok, parsers = pcall(require, "nvim-treesitter.parsers")
if not ok then
  print("nvim-treesitter.parsers failed to load")
  return
end
parsers.get_parser_configs().tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
