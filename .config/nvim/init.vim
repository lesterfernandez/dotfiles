source $HOME/.config/nvim/vim-plug/plugins.vim

lua require('init')

inoremap jk <ESC>
nnoremap <silent> <Leader>- :resize -3<CR>
nnoremap <silent> <Leader>+ :resize +3<CR>
nnoremap <silent> <Leader>> :vertical resize +3<CR>
nnoremap <silent> <Leader>< :vertical resize -3<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>
snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" autocmds
augroup FileSpecifics
  au!
  autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
  autocmd BufRead,BufNewFile *.html,*.jsx,*.tsx inoremap <expr> <Enter> EnterOrIndentTag()  
augroup END

" nvimtree 
" :help nvim_tree_highlight
highlight NvimTreeFolderIcon guibg=blue
" fix nvim tree coloring
highlight NvimTreeBg guibg=None cterm=None
highlight! NvimTreeFolderIcon guibg=None ctermbg=None
nnoremap <silent><C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" fzf
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'
noremap <C-p> :Files<Cr>
nnoremap <silent><CR> :noh<CR><CR>

set shortmess+=c

let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" airline settings
let g:airline_theme='base16_gruvbox_dark_medium'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" html util
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

