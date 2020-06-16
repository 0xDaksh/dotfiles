set noerrorbells
set smartcase
set colorcolumn=90
set guicursor=

" Indentation
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

" Relative Number Pane
set number
set relativenumber

" Code Folding
set foldmethod=manual  

" undo dir
if !isdirectory($HOME."/.nvim/undo-dir")
  call mkdir($HOME."/.nvim/undo-dir", "", 0700)
endif
set undodir=~/.nvim/undo-dir

set undofile

" incremental search
set incsearch
set hlsearch

" encoding
set encoding=UTF-8

" Mouse Cursor
set mouse=a

" Syntax Color
syntax enable
syntax on

" Cursor Line
set cursorline

" ColorScheme
if (has("termguicolors"))
  set termguicolors
endif

" Clipboard
set clipboard=unnamedplus

" Tmux fix
if &term =~ '256color'
  set t_ut=
endif

""" The Keymaps
let mapleader = " "

" NerdTree
map <C-n> :NERDTreeToggle<CR>

" Disable Arrow Key
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Normal on jj
imap jj <Esc>

" Buffer and tab Management
nmap <silent> <leader>bn :bn<CR>
nmap <silent> <leader>bp :bp<CR>
nmap <silent> <leader>bd :bd<CR>
nmap <silent> <leader>mn :tabn<CR>
nmap <silent> <leader>mc :tabclose<CR>
nmap <silent> <leader>mp :tabp<CR>
nmap <silent> <leader>mh :tabm - 1<CR>
nmap <silent> <leader>ml :tabm + 1<CR>

" Helper keys
nmap <C-a> A 
nmap <C-x><C-t> :split<CR>:term<CR>i
imap <C-a> <END> 
nmap <leader>w :w<CR>
nnoremap <leader><leader> <c-^>


" Tags
nmap <leader>l :Vista!!<CR>

" CPP Build command
fun! BuildCPP()

  nmap <C-x>s :%s/std::/<CR>
  nnoremap <C-x>c :!g++ -std=c++17 -O2 % -Wall -g -o out <CR>:split<CR>:term<CR>i ./out

endfun

autocmd FileType cpp,cc,cxx,h,hpp :call BuildCPP()
