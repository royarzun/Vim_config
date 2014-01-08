" javascript.vim: settings for Javascript files

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPTIONS                               {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setlocal textwidth=0                        " Do not break long lines
setlocal tabstop=2                          " Tabs use 2 spaces
setlocal shiftwidth=2                       " Indent using 2 spaces
setlocal formatoptions=tq2                  " Format text

" Google closure linter
let g:syntastic_javascript_checkers = ['gjslint']

"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: foldmethod=marker
