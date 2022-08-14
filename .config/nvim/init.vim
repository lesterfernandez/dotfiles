source $HOME/.config/nvim/vim-plug/plugins.vim

lua require('init')

" autocmds
augroup FileSpecifics
  au!
  autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
  autocmd BufRead,BufNewFile *.html,*.jsx,*.tsx inoremap <expr> <Enter> EnterOrIndentTag()  
augroup END

" html util
" i dont have the time right now to convert this to lua
function EnterOrIndentTag()
    let line = getline(".")
    let col = getpos(".")[2]
    let before = line[col-2]
    let after = line[col-1]

    if before == ">" && after == "<"
        return "\<Enter>\<C-o>O"
    endif
    return "\<Enter>"
endfunction

