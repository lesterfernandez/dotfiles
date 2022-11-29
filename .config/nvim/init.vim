lua require('init')

" autocmds
augroup FileSpecifics
  au!
  autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
augroup END
