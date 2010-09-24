"
" vimrc
"
" Finlay Cannon 
"

set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
vmap <BS> x

" general stuff
set nobackup
set history=50
set ruler
set showcmd	
set autoindent
set smartindent
set nowrap
set showmatch
set modelines=0    " turn off modelines (some security exploits)
set scrolloff=3    " scroll before the end of the page
set shortmess=aIoO " short messages, no intro
set splitbelow

"set nofsync

" tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" searching
set ignorecase   " ignore case during searches
set smartcase    " except when there are CapitalLetters
set gdefault     " make s///g the default
set incsearch
set hlsearch
set wrapscan

" make regexes work like Perl
nnoremap / /\v
vnoremap / /\v

" autocomplete when opening files. Behaves somewhat similarly to bash.
set wildignore=*.bak,*.swp,*.pyc,*.o,*.obj,*.dll,*.exe
set wildmenu
set wildmode=list:longest

"-- shortcuts -----------

" turn off highlight
nnoremap <leader><space> :nohl<cr>

" strip all trailing whitespace in the file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" re-hardwrap a paragraph of text
nnoremap <leader>q gqip

" re-select pasted text
nnoremap <leader>v V`]

" quick edit for .vimrc
nnoremap <leader>ev <C-w><C-s><C-l>:e $MYVIMRC<cr>

" underline
nnoremap <leader>u yypVr-

" fix line ends
nnoremap <leader>n :%s/\r/\n/g<cr>

"------------------------


" Don't use Ex mode, use Q for formatting
map Q gq

" colors and syntax highlighting
if &t_Co > 2 || has("gui_running")
    syntax on
    colorscheme desert
    set bg=dark
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
