local ok, formatter = pcall(require, 'formatter')
if not ok then
  print('Formatter Plug In Error')
end

formatter.setup {
  filetype = {
    python = {
      require('formatter.filetypes.python').black
    }
  }
}
