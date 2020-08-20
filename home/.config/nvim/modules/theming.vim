" colors
colorscheme  one

" rainbow
augroup rainbow_lisp
  autocmd!
  autocmd FileType python,javascript,typescript,cpp,cc,h RainbowParentheses
augroup END

let g:airline_theme = 'one'
