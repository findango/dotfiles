"
" vimrc
"
" Finlay Cannon 
"

" load bundles from ~/.vim/bundle
filetype off
call pathogen#infect()
filetype plugin indent on

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
set modelines=0     " turn off modelines (some security exploits)
set scrolloff=3     " scroll before the end of the page
set shortmess=aIoOt " short messages, no intro
set splitbelow      " new splits below existing
set tildeop         " use ~ like an operator
set autochdir       " automatically cd to the current file's dir
set clipboard=unnamed  " use the OS clipboard by default
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

" make Y behave like other capitals
map Y y$

" reselect blocks after indent
vnoremap < <gv
vnoremap > >gv

" autocomplete when opening files. Behaves somewhat similarly to bash.
set wildignore=*.bak,*.swp,*.pyc,*.o,*.obj,*.dll,*.exe
set wildmenu
set wildmode=list:longest

"-- shortcuts -----------

" turn off highlight
nnoremap <leader><space> :nohl<CR>

" strip all trailing whitespace in the file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" re-hardwrap a paragraph of text
nnoremap <leader>q gqip

" re-select pasted text
nnoremap <leader>v V`]

" quick edit for .vimrc
nnoremap <leader>ev <C-w><C-s><C-l>:e $MYVIMRC<CR>
nnoremap <leader>evl <C-w><C-s><C-l>:e $MYVIMRC.local<CR>

" underline
nnoremap <leader>u yypVr-

" fix line ends
nnoremap <leader>n :%s/\r/\n/g<CR>

" toggle NERDTree browser
nnoremap <leader>t :NERDTreeToggle<CR>

" toggle line numbering
nnoremap <leader>l :set invnumber<CR>

" toggle invisibles
noremap <Leader>i :set list!<CR>

" switch between tabs
nmap <C-Right> :tabn<CR>
nmap <C-Left>  :tabp<CR>

"nmap <C-Up> :windown<CR>
"nmap <C-Down> :windowp<CR>

" Bubble single lines
nmap <C-Up> ddkP
nmap <C-Down> ddp

" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" quick format XML
nnoremap <leader>x :%s/></>\r</<CR>:0<CR>=:$<CR>

" add a semicolon ';' at the end of the line
nnoremap ;; A;<Esc>

" smart home- and end-key behaviour
noremap <expr> <Home> (col('.') == matchend(getline('.'), '^\s*')+1 ? '0' : '^')
noremap <expr> <End> (col('.') == match(getline('.'), '\s*$') ? '$' : 'g_<right>')
vnoremap <expr> <End> (col('.') == match(getline('.'), '\s*$') ? '$h' : 'g_')
imap <Home> <C-o><Home>
imap <End> <C-o><End>

" reposition the cursor inside common programming doubles 
inoremap ""  ""<Left>
inoremap ''  ''<Left>
inoremap {}  {}<Left>
inoremap []  []<Left>
"inoremap ()  ()<Left>
"inoremap ()) ()

" do syntax highlighting from the start of the file
autocmd BufEnter * :syntax sync fromstart

"------------------------

" Don't use Ex mode, use Q for formatting
map Q gq

" colors and syntax highlighting
if &t_Co > 2 || has("gui_running")
    syntax on
    set bg=dark
    
    colorscheme twilight
    hi Cursor guibg=#96B2CD
    hi MatchParen gui=none guibg=#52665C
    hi LineNr guibg=#0d0d0d
    hi Search guibg=#fada5e
    hi link NERDTreeRO Comment
endif

" initial size
if has("gui_running")
    set lines=50 columns=90
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

	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
    
    " tab settings for specific filetypes
    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab number

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

" automatically reload vimrc after editing
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
    autocmd bufwritepost .vimrc.local source $MYVIMRC
endif

" load any local settings
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif

