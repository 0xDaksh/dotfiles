" Vimtex
let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
if has("nvim")
  let g:vimtex_compiler_progname = 'nvr'
endif
let g:vimtex_view_method = 'zathura'
