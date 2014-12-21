" javascript.vim: settings for Javascript files

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2


" Delete trailing white space on buffer write
autocmd BufWritePre *.js :%s/\s\+$//e
