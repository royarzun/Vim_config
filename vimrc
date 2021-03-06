" ~/.vimrc: executed by Vim at startup

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS                               {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use NeoBundle
filetype off
set nocompatible

if has('vim_starting')
  let s:neobundle_dir = expand("~/.vim/share/neobundle.vim")
  if isdirectory(s:neobundle_dir. "/plugin")
    exe "set runtimepath+=" . s:neobundle_dir
    call neobundle#rc()
  else
    echomsg 'Plugin manager "neobundle" not found.'
    echomsg 'Run "git submodule update --init" in your $VIMHOME directory.'
    exit
  endif
endif

" Load bundles
source ~/.vim/bundle.vim

" Load bundles of the fork
if filereadable(expand("~/.vim/bundle.fork"))
  source ~/.vim/bundle.fork
endif

" Load bundles of the local machine
if filereadable(expand("~/.vim/bundle.local"))
  source ~/.vim/bundle.local
endif

syntax on
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS CONFIGURATION                 {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SuperTab                                  {{{2
if has("gui_running")
  let g:SuperTabMappingForward = '<C-Space>'
  let g:SuperTabMappingBackward = '<S-C-space>'
else
  let g:SuperTabMappingForward = '<C-@>'
  let g:SuperTabMappingBackward = '<C-S-@>'
endif
let g:SuperTabDefaultCompletionType = "context"

" Ultisnips                                 {{{2
inoremap <silent>   <C-@>         <nop>
if has("gui_running")
  let g:UltiSnipsExpandTrigger = "<C-Space>"
else
  let g:UltiSnipsExpandTrigger = "<C-@>"
endif
let g:UltiSnipsJumpForwardTrigger = "<TAB>"
let g:UltiSnipsJumpBackwardTrigger = "<S-TAB>"
let g:UltiSnipsListSnippets = "<leader>ls"
let g:UltiSnipsEditSplit='horizontal'
let g:UltiSnipsDontReverseSearchPath = 1

" vim-addon-local-vimrc                     {{{2
let g:local_vimrc = {
        \ 'names': ['.project.vim'],
        \ 'hash_fun': 'LVRHashOfFile',
        \ 'cache_file': $HOME . '/.cache/vim_local_rc_cache',
        \ }

" Fugitive                                  {{{2
nnoremap gs :Gstatus<CR>
nnoremap gc :Gcommit<CR>

" ctrlp                                     {{{2
if has("gui_running")
  nnoremap <silent> <C-Space> :CtrlPBuffer<CR>
else
  nnoremap <silent> <C-@>     :CtrlPBuffer<CR>
endif
nnoremap <silent> <C-N>     :CtrlPMRU<CR>
nnoremap <silent> g[        :CtrlPBufTag<CR>
nnoremap <silent> g{        :CtrlPBufTagAll<CR>
let g:ctrlp_working_path_mode = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_mruf_max = 50
let g:ctrlp_dotfiles = 1
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|javadoc$\|html$'
  \ }

" Ack                                       {{{2
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
let g:ack_wildignore=0

" Syntastic                                 {{{2
let g:syntastic_mode_map = { 'passive_filetypes': ['java'] }
let g:syntastic_c_check_header = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_config_file = '.clang_complete'
let g:syntastic_c_config_file = '.clang_complete'
if v:version == 700
  let g:syntastic_enable_highlighting = 0
endif

" Tagbar                                    {{{2
nnoremap <silent> <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_singleclick = 1

" Airline                                   {{{2
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='powerlineish'
let g:airline#extensions#disable_rtp_load = 1

" Alternate                                 {{{2
let g:alternateExtensions_cc  = "hh,h,hpp,hxx"
let g:alternateExtensions_cpp = "hpp,h,hh,hxx"
let g:alternateExtensions_C   = "h,H"
let g:alternateExtensions_hh  = "cc,cpp,cxx"
let g:alternateExtensions_h   = "c,cpp,cxx,cc,C"
let g:alternateExtensions_hpp = "cpp,cxx,C,cc"
let g:alternateExtensions_hxx = "cpp,cxx,C,cc"

" Clang Complete                            {{{2
let g:clang_auto_select=1
let g:clang_snippets=1
let g:clang_snippets_engine='ultisnips'
let g:clang_complete_copen=0
let g:clang_user_options="-DCLANG -fcxx-exceptions"

" LaTeX Suite                               {{{2
let g:tex_flavor="latex"              " filetype of *.tex, so LaTeXSuite works
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_IgnoreLevel=11
let g:Tex_IgnoredWarnings="Underfull\n".
                         \"Overfull\n".
                         \"specifier changed to\n".
                         \"You have requested\n".
                         \"Missing number, treated as zero\n".
                         \"There were undefined references\n".
                         \"Citation %.%# undefined\n".
                         \"Reference %.%# undefined\n".
                         \"Label `' multiply defined\n".
                         \"Label(s) may have changed\n".
                         \"There were multiply-defined labels"

" Fix e-acute problem in insert mode
imap   <buffer>   <C-L>i  <Plug>Tex_InsertItemOnThisLine

" Send to Evernote                          {{{2
let g:evernote_gmail_username = "smancill.m"
let g:evernote_email_local_part  = "smancill.d0477"

" Buffergator                               {{{2
nnoremap <silent>  <Space><Space> :BuffergatorOpen<CR>
nnoremap <silent>  <C-_>          :BuffergatorTabsOpen<CR>
let g:buffergator_suppress_keymaps=1
let g:buffergator_viewport_split_policy="B"
let g:buffergator_split_size=12

" Gist                                      {{{2
let g:gist_clip_command = 'xclip -selection clipboard'

" netrw                                     {{{2
let g:netrw_list_hide = '^\.,\~$,^tags$'
let g:netrw_altfile = 1
let g:netrw_dirhistmax = 0

" NERDTree                                  {{{2
nnoremap <silent>  <F3>              :NERDTreeToggle<CR>
let NERDTreeHijackNetrw=0
let NERDTreeIgnore=[
                   \'\.d$[[dir]]',
                   \'\.git$[[dir]]',
                   \'\.hg$[[dir]]',
                   \'tags$[[file]]',
                   \'\.class$[[file]]',
                   \'\.o$[[file]]',
                   \'\.os$[[file]]',
                   \'\.so$[[file]]',
                   \'\.gch$[[file]]',
                   \'\.py[co]$[[file]]',
                   \'\.rb[co]$[[file]]'
                   \]

" }}}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPTIONS                               {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set history=500                             " How many lines of history
set vb t_vb=                                " Disable beep
set synmaxcol=128                           " Prevent lag with long lines
set nrformats-=octal                        " Don't detect octal numbers

set ttimeout                                " Time out mappings and keycodes
set ttimeoutlen=100                         " Shorter time out for keycodes

set autoread                                " Read files if changed outside
set nobackup                                " Do not use backups (Git FTW)
set fileencoding=utf-8                      " Default file encoding
set fileformats=unix,dos,mac                " Support all EOLs by default
set fileformat=unix                         " Default end of line

set directory^=~/.cache/vim//               " Location of swap files
set backupdir^=~/.cache/vim//               " Location of backup files
if has('persistent_undo')
  set undodir^=~/.cache/vim//               " Location of undo files
  set undofile                              " Active persistent undo
endif

set mouse=a                                 " Use mouse in all modes
set backspace=indent,eol,start              " Backspace works in Insert mode
set whichwrap=b,s,<,>,[,]                   " Move cursor to other lines

set hidden                                  " Change buffer whitout saving
set switchbuf=useopen                       " Change to buffer in open window
set splitright                              " New windows on the right

set tabpagemax=15                           " Show 15 tabs
set showmode                                " Always show the mode
set showcmd                                 " Always show the command
set ruler                                   " Show position of the cursor
set number                                  " Show line numbers
set laststatus=2                            " Always show statusline
set shortmess=aI                            " Abbreviate status messages
set rulerformat=%25(%LL\ \ \ %l,%c%V%=%P%)  " Ruler string

set wildmenu                                " Better command-line completion
set wildmode=longest,full                   " Completion options
set wildignore=*.bak,*.o,*.os,*.so,*.gch,*.class,*~,*.py[co],*.rb[co]
                                            " Ignore these files

set tabstop=4                               " Four spaces for a tab
set softtabstop=4                           " Four spaces for a tab
set smarttab                                " Smart tabs at beginning of line
set expandtab                               " Use spaces instead of tabs
set shiftround                              " Indent to multiple of shiftwidth
set shiftwidth=4                            " Default indent of four spaces

set autoindent                              " Indent new lines using previous
set nojoinspaces                            " One space after sentences
set wrap                                    " Softwrap long lines
set linebreak                               " Wrap at spaces characters
set display+=lastline                       " If wrap set, display last line
set virtualedit=block                       " Move freely in visual block

set incsearch                               " Search word while typing
set ignorecase                              " Ignore case in search patterns
set smartcase                               " But override if uppercase used
set hlsearch                                " Highlight search

set complete-=i                             " Ignore include files
set completeopt=menu,preview,longest        " Completion menu options
set pumheight=10                            " Size of completion menu

set spelllang=es,en                         " Spelling languages
set spellsuggest=10                         " Number of spelling suggestions
set spellfile=~/.vim/spell/mine.utf-8.add   " Spell file for additions

set tags=./.tags;,./tags;                   " Use a dot tags file

set viminfo^=!                              " Save uppercase variables
set sessionoptions-=options                 " Options can corrupt sessions

" Better unprintable characters
if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
  let &listchars="tab:\u25b8 ,trail:\u2423,nbsp:\u26ad,eol:\u00ac,extends:\u21c9,precedes:\u21c7"
  let &fillchars="fold:\u00b7"
  let &showbreak="\u00bb "
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GLOBAL MAPPINGS                       {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle ['] and [`] keys for moving to marks
nnoremap ' `
nnoremap ` '

" Better navigation in long lines
nnoremap j  gj
nnoremap k  gk

" Buffers
nnoremap <silent>   <C-k>         <C-^>

" Make Y consistent with C and D.  See :help Y.
nnoremap Y y$

" Omnicompletion popup menu like IDE
inoremap <expr>     <CR>          pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr>     <Down>        pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr>     <Up>          pumvisible() ? "\<C-p>" : "\<Up>"

" Command line history
cnoremap            <C-P>         <Up>
cnoremap            <C-N>         <Down>

" Toggle paste
nnoremap            <F12>         :set invpaste<CR>:set paste?<CR>

" Disable unwanted keys in normal mode
nnoremap            <F1>          <nop>
nnoremap            Q             <nop>

" Write as sudo
cnoremap            w!!           w !sudo tee % >/dev/null

" Better tags navigation
nnoremap            <C-]>         g<C-]>
vnoremap            <C-]>         g<C-]>
nnoremap            g<C-]>        <C-]>
vnoremap            g<C-]>        <C-]>

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AUTOCOMMANDS                          {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup vimrc_autocommands
autocmd!

" Restore cursor position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif

" Automatically close popup menu and preview window for omnicompletion
autocmd CursorMovedI,InsertLeave *
    \ if pumvisible() == 0 |
    \   silent! pclose |
    \ endif

" Always put quickfix window in the bottom
autocmd FileType qf wincmd J

" If last windows is quickfix window, exit Vim
autocmd BufEnter *
    \ if &buftype=="quickfix" || &buftype=="nofile" |
    \   if winbufnr(2) == -1 |
    \     quit! |
    \   endif |
    \ endif

" Move to the parent directory in any fugitive tree or blob
autocmd User Fugitive
    \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
    \   nnoremap <silent> <buffer> .. :edit %:h<CR> |
    \ endif

" Autoclean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" Always start on first line of Git commit message
autocmd BufEnter *
    \ if &filetype == 'gitcommit' |
    \   call setpos('.', [0, 1, 1]) |
    \ endif

augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COMMANDS                              {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command! -nargs=0 DiffOrig vert new | set bt=nofile | r # | 0d_ |
  \ diffthis | wincmd p | diffthis

" Python calculator on command line
command! -nargs=+ CC :py print <args>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TERM AND COLORSCHEME                  {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
  let s:color_squeme = "inkpot"
elseif $TERM =~ 'rxvt' || $TERM =~ '256color'
  set t_Co=256
  let s:color_squeme = "darkglass"
endif

try
  if exists("s:color_squeme")
    exe "colorscheme " . s:color_squeme
  endif
catch /^Vim\%((\a\+)\)\=:E185/
endtry

" Change color of completion menu according to the terminal and current
" colorsqueme
highlight PmenuSel ctermbg=white
highlight PmenuSel ctermfg=black


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EXTRA CONFIGURATION                   {{{1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Load vimrc of the fork
if filereadable(expand("~/.vim/vimrc.fork"))
  source ~/.vim/vimrc.fork
endif

" Load vimrc of the local machine
if filereadable(expand("~/.vim/vimrc.local"))
  source ~/.vim/vimrc.local
endif

"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: foldmethod=marker
