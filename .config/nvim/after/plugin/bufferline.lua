local ok, bufferline = pcall(require, "bufferline")
if not ok then
  return
end

vim.opt.termguicolors = true
bufferline.setup {
  options = {
    diagnostics = "lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true
      }
    }
  }
}
