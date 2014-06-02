" ruby.vim: settings for Ruby files

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPTIONS                               {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

setlocal tabstop=2                          " Tabs use 2 spaces
setlocal softtabstop=2                      " Tabs use 2 spaces
setlocal shiftwidth=2                       " Indent using 2 spaces

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCMD                             {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Delete trailing white space on buffer write
autocmd BufWritePre *.rb :%s/\s\+$//e

"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: foldmethod=marker
