" scss.vim: settings for Sass files

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2


" Delete trailing white space on buffer write
autocmd BufWritePre *.scss :%s/\s\+$//e
