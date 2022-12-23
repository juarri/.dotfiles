local status, _ = pcall(vim.cmd, "colorscheme poimandres")
if not status then
  print("Colorscheme not found!")
  return
end
