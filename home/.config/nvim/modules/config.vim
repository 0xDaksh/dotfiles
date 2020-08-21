set noerrorbells
set nowrap
set smartcase
set colorcolumn=90

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
nmap <silent> ]b :bn<CR>
nmap <silent> [b :bp<CR>
nmap <silent> <leader>bd :Bdelete<CR>
nmap <silent> [t :tabn<CR>
nmap <silent> ]t :tabp<CR>
nmap <silent> <leader>td :tabclose<CR>

" Helper keys
nmap <C-a> A 
nmap <C-x><C-t> :split<CR>:term<CR>i
imap <C-a> <END>
nmap <leader>w :w<CR>
nnoremap <leader>b <c-^>

" CPP Build command
fun! BuildCPP()
  nmap <C-x>s :%s/std::/<CR>
  nnoremap <C-x>c :!g++ -std=c++17 -O2 % -Wall -g -o out <CR>:split<CR>:term<CR>i ./out
endfun

autocmd FileType cpp,cc,cxx,h,hpp :call BuildCPP()

let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'

nmap <Leader><Leader> <Plug>(easymotion-prefix)

" Remove :W
command! -bang -nargs=* W :w
