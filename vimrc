"
" vimrc
"
" Finlay Cannon 
"

set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
vmap <BS> x

set nobackup
set history=50
set ruler
set showcmd	
set incsearch

set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set nowrap


" Don't use Ex mode, use Q for formatting
map Q gq

" colors and syntax highlighting
if &t_Co > 2 || has("gui_running")
    syntax on
    colorscheme desert
    set bg=dark
    "set hlsearch
endif

" initial size
if has("gui_running")
    set lines=40 columns=80
endif


" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
    au!
    au! BufRead,BufNewFile *.zpt set filetype=xml

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif

    augroup END

else

    " always set autoindenting on
    set autoindent

endif
