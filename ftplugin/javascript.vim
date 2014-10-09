" javascript.vim: settings for Javascript files

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPTIONS                               {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setlocal textwidth=0                        " Do not break long lines
setlocal tabstop=2                          " Tabs use 2 spaces
setlocal shiftwidth=2                       " Indent using 2 spaces
setlocal formatoptions=tq2                  " Format text

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCMD                             {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Delete trailing white space on buffer write
autocmd BufWritePre *.js :%s/\s\+$//e

"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: foldmethod=marker
