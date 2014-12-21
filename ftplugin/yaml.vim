" yaml.vim: settings for YAML files

" Delete trailing white space on buffer write
autocmd BufWritePre *.yml :%s/\s\+$//e

" Highlight trailing white space on red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/


setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
