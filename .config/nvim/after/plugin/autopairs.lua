local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
  print("nvim-autopairs failed to load")
  return
end

autopairs.setup {}
