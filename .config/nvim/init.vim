source $HOME/.config/nvim/vim-plug/plugins.vim

lua require('init')

inoremap jk <ESC>
set autoindent " copy indent from last line when inserting a new line
set smartindent " indent in braces and other things
set inccommand=split
set lazyredraw
set ignorecase
set smarttab " insert tabs with shiftwidth value
filetype plugin indent on
set tabstop=2 " tab size
set shiftwidth=2 " indentation size
set expandtab " replace tabs with space
set relativenumber 
set number
set scrolloff=7
set colorcolumn=80
set hid
set termguicolors " this variable must be enabled for colors to be applied properly
" set updatetime=1200 
set splitbelow
set splitright
set noshowmode " do not show text displaying mode (airline replaces this)

colorscheme gruvbox-baby

let mapleader = ","

nnoremap <C-n> :NvimTreeToggle<CR> :set number<CR> :set relativenumber<CR><CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

nnoremap <silent> <Leader>- :resize -3<CR>
nnoremap <silent> <Leader>+ :resize +3<CR>
nnoremap <silent> <Leader>> :vertical resize +3<CR>
nnoremap <silent> <Leader>< :vertical resize -3<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'
noremap <C-p> :Files<Cr>
nnoremap <CR> :noh<CR><CR>

set shortmess+=c

let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
let g:airline_theme='base16_gruvbox_dark_medium'
let g:airline_powerline_fonts = 1

" proper nvim tree coloring
highlight NvimTreeBg guibg=None cterm=None
highlight! NvimTreeFolderIcon guibg=None ctermbg=None

autocmd BufWritePre * lua vim.lsp.buf.formatting_seq_sync()

