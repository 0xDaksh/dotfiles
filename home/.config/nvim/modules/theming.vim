" colors
let g:gruvbox_material_palette = 'material'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_italic=1
let g:gruvbox_material_transparent_background = 1

colorscheme gruvbox-material

" rainbow
augroup rainbow_lisp
  autocmd!
  autocmd FileType python,javascript,typescript RainbowParentheses
augroup END

let g:lightline = {
      \ 'colorscheme': 'gruvbox_material',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'cocstatus': 'coc#status'
      \ },
      \ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
