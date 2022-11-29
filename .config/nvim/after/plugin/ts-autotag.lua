local ok, ts_autotag = pcall(require, "nvim-ts-autotag")
if not ok then
  print("nvim-ts-autotag failed to load")
  return
end

ts_autotag.setup({})
