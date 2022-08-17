source $HOME/.config/nvim/vim-plug/plugins.vim

lua require('init')

" autocmds
augroup FileSpecifics
  au!
  autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
  autocmd BufRead,BufNewFile *.html,*.jsx,*.tsx inoremap <expr> <Enter> EnterOrIndentTag()  
augroup END

" HTML util
function! EnterOrIndentTag()
    let line = getline(".")
    let col = getpos(".")[2]
    let before = line[col-2]
    let after = line[col-1]

    if before == ">" && after == "<"
        return "\<Enter>\<C-o>O"
    endif
    return "\<Enter>"
endfunction

" FZF config
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_action =  {'ctrl-t': 'tab split', 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
