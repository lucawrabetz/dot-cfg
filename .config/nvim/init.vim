au! BufWritePost $VIMRC source %

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
let g:python3_host_prog = $PYTHON3

call plug#begin()
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sirver/ultisnips'
Plug 'lervag/vimtex'
Plug 'danilo-augusto/vim-afterglow'
Plug 'morhetz/gruvbox'
Plug 'nikolvs/vim-sunbather'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/seoul256.vim'
Plug 'EdenEast/nightfox.nvim'
Plug 'sainnhe/everforest'
call plug#end()

set fileencoding=utf-8
set fileencodings=utf-8,gbk,chinese,cp936,gb18030,utf-16le,utf-16,big5,euc-jp,euc-kr,latin-1
filetype plugin indent on
syntax enable

set termguicolors
colorscheme everforest
hi Normal guibg=NONE ctermbg=NONE

set hidden
set nobackup
set nowritebackup
set splitbelow
set splitright
set number
set relativenumber
set mouse=inv
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab
set smartindent
set autoindent
set foldmethod=indent
set showtabline=2
set updatetime=100
set timeoutlen=500
set shortmess+=c
set clipboard=unnamedplus
set formatoptions=tcl

augroup common
  autocmd!
  autocmd BufNewFile,BufRead *.jl setlocal filetype=julia
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
  autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
  autocmd BufNewFile,BufRead *.jsx setlocal filetype=javascript.jsx
  autocmd BufNewFile,BufRead *.json setlocal filetype=jsonc
  autocmd BufNewFile,BufRead deno.lock setlocal filetype=json

  autocmd FileType markdown setlocal suffixesadd=.md
  autocmd FileType json syntax match Comment +\/\/.\+$+
  autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0
  autocmd FileType lua,ruby,html,javascript,typescript,css,json,vue,vim,yaml setlocal shiftwidth=2 tabstop=2
  " need to debug: autocmd FileType tex inoremap ` `'<C-g>U
augroup end

" ~functions~
func! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunc

func! DeleteTrailingWS() abort
  exe "normal! mz"
  %s/\s\+$//ge
  exe "normal! 'z"
  echo "Trailing whitespace removed."
endfunc

" TODO include this function and DeleteTrailingWS() in save all and quit
" remaps
func! SaveAllAndCleanup()
  silent call DeleteTrailingWS()
  wa
  echo "All buffers saved."
endfunc
command! SaveAllAndCleanup call SaveAllAndCleanup()

    " mapping notation cheat sheet:
    "	<BS>           Backspace
    "	<Tab>          Tab
    "	<CR>           Enter
    "	<Enter>        Enter
    "	<Return>       Enter
    "	<Esc>          Escape
    "	<Space>        Space
    "	<Up>           Up arrow
    "	<Down>         Down arrow
    "	<Left>         Left arrow
    "	<Right>        Right arrow
    "	<F1> - <F12>   Function keys 1 to 12
    "	#1, #2..#9,#0  Function keys F1 to F9, F10
    "	<Insert>       Insert
    "	<Del>          Delete
    "	<Home>         Home (start of line)
    "	<End>          End (end of line)
    "	<PageUp>       Page-Up
    "	<PageDown>     Page-Down
    "	<bar>          the '|' character, which otherwise needs to be escaped '\|'
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"
nnoremap <leader>w :wa<CR>
nnoremap <leader>q :wa<CR>:qa<CR>
nnoremap <leader>fq :qa!<CR>
inoremap ;; <Esc>la
" use alt + hjkl to resize windows TODO : FIGURE OUT M/ALT OR A DIFFERENT MAP
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>
inoremap gf <Esc>
inoremap fg <Esc>
inoremap FG <Esc>
inoremap GF <Esc>
inoremap ;; <Esc>la
nnoremap <Leader>0 <C-w>v
nnoremap <Leader>9 <C-w>s
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <Leader>o :bnext<CR>
nnoremap <Leader>i :bprev<CR>

" ~<air, tmux>line~
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1 "enable the list of buffers
let g:tmuxline_powerline_separators = 0

" ~coc~
" let $COC_SETTINGS = expand('~/.config/nvim/coc-settings.json')
if has("nvim-0.5.0") || has("patch-8.1.1564")
  "merge signcolumn and number column into one
  "always show sign column so it doesn't shift text constantly
  set signcolumn=number
else
  set signcolumn=yes
endif
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1) :
  \ CheckBackspace() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" ~vimtex~
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
let g:vimtex_view_method='skim'
let conceallevel=1
let g:tex_conceal='abdmg'
" inoremap <leader><leader> <Esc>/<(++)><CR>c6l
" vnoremap <leader><leader> <Esc>/<(++)><CR>c6l
" map <leader><leader> <Esc>/<(++)><CR>c6l

" ~ultisnips~
let g:UltiSnipsExpandTrigger = '<Leader>;'
let g:UltiSnipsJumpForwardTrigger = '<Leader>;'
let g:UltiSnipsJumpBackwardTrigger = '<Leader>,'
let g:UltiSnipsSnippetDirectories = [$NVIM . '/UltiSnips/']
