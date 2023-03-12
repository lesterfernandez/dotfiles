local ok, git_conflict = pcall(require, "git-conflict")
if not ok then
  print("git-conflict failed to load")
  return
end

git_conflict.setup({})
