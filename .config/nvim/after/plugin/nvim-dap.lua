local ok, dap = pcall(require, "dap")
if not ok then
  print("dap failed to load")
  return
end

dap.adapters.cppdbg = {
  id = 'cppdbg',
  type = 'executable',
  command = '$HOME/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}
