" ~/.vimrc: executed by Vim at startup

set nocompatible
syntax on
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPTIONS                               {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set history=500                             " How many lines of history
set vb t_vb=                                " Disable beep

set autoread                                " Read files if changed outside
set nobackup                                " Do not use backups (Git FTW)
set directory=./.swp,~/.vim/.files,/tmp     " Change path to swap files
set backupdir=./.bak,~/.vim/.files,/tmp     " Change path to backup files
set fenc=utf-8                              " Default file encoding
set ff=unix                                 " Default end of line

set mouse=a                                 " Use mouse in all modes
set backspace=indent,eol,start              " Backspace works in Insert mode
set whichwrap=b,s,<,>,[,]                   " Move cursor to other lines

set hidden                                  " Change buffer whitout saving
set switchbuf=usetab                        " Change to buffer in open tab

set tabpagemax=15                           " Show 15 tabs
set showmode                                " Always show the mode
set showcmd                                 " Always show the command
set ruler                                   " Show position of the cursor
set laststatus=2                            " Always show statusline
set rulerformat=%25(%LL\ \ \ %l,%c%V%=%P%)  " Ruler string

set wildmenu                                " Better command-line completion
set wildmode=longest,full                   " Completion options
set wildignore=*.bak,*.o,*.e,*~             " Ignore this files

set tabstop=4                               " Four spaces for a tab
set expandtab                               " Use spaces instead of tabs
set shiftround                              " Indent to multiple of shiftwidth
set shiftwidth=4                            " Default indent of four spaces

set formatoptions=tq2                       " Set format options
set autoindent                              " Indent new lines using previous

set incsearch                               " Search word while typing
set ignorecase                              " Ignore case in search patterns
set smartcase                               " But override if uppercase used

set completeopt=menu,preview,longest        " Completion menu options
set pumheight=10                            " Size of completion menu

set spelllang=es,en                         " Spelling languages
set spellsuggest=10                         " Number of spelling suggestions

set tags+=.tags                             " Use a dot tags file

set listchars=tab:▸\ ,eol:¬                 " Better unprintable characters


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GLOBAL MAPPINGS                       {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle ['] and [`] keys for moving to marks
nnoremap ' `
nnoremap ` '

" Better navigation in long lines
nnoremap j  gj
nnoremap k  gk

" Remap keys that will be used as normal mode mappings
nnoremap <silent>   <space>h      H
nnoremap <silent>   <space>m      M
nnoremap <silent>   <space>l      L

" Buffers
nnoremap <silent>   K             <C-^>
nnoremap            H             :bprevious<CR>
nnoremap            L             :bnext<CR>

" Command line history
cnoremap            <C-P>         <Up>
cnoremap            <C-N>         <Down>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCOMMANDS                          {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Restore cursor position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif


"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: foldmethod=marker