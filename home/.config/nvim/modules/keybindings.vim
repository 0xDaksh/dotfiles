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

