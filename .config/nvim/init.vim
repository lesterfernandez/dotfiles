source $HOME/.config/nvim/vim-plug/plugins.vim

lua require('init')

inoremap jk <ESC>
set inccommand=split
set lazyredraw
set ignorecase
set hlsearch
set incsearch
set autoindent " copy indent from last line when inserting a new line
set smartindent " indent in braces and other things
set smarttab " insert tabs with shiftwidth value
set tabstop=2 " tab size
set shiftwidth=2 " indentation size
set expandtab " replace tabs with space
set number
set relativenumber 
set scrolloff=7
set colorcolumn=80
set hid
set termguicolors " this variable must be enabled for colors to be applied properly
set splitbelow
set splitright
set noshowmode " do not show text displaying mode (airline replaces this)

" set background=dark
" Available values: 'hard', 'medium'(default), 'soft'
" let g:gruvbox_material_background = 'medium'
" let g:gruvbox_material_better_performance = 1
" colorscheme gruvbox-material
colorscheme gruvbox-baby

" remaps
let mapleader = ","
nnoremap <silent> <Leader>- :resize -3<CR>
nnoremap <silent> <Leader>+ :resize +3<CR>
nnoremap <silent> <Leader>> :vertical resize +3<CR>
nnoremap <silent> <Leader>< :vertical resize -3<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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

" autocmds
autocmd BufWritePre * lua vim.lsp.buf.formatting_seq_sync()
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
autocmd BufRead,BufNewFile *.html,*.jsx,*.tsx inoremap <expr> <Enter> EnterOrIndentTag()  

" nvimtree 
" :help nvim_tree_highlight
highlight NvimTreeFolderIcon guibg=blue
" fix nvim tree coloring
highlight NvimTreeBg guibg=None cterm=None
highlight! NvimTreeFolderIcon guibg=None ctermbg=None
nnoremap <C-n> :NvimTreeToggle<CR> :set number<CR> :set relativenumber<CR><CR>
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
