"
" vimrc
"
" Finlay Cannon 
"

set nocompatible

" load bundles from ~/.vim/bundle
filetype off
call pathogen#infect()
filetype plugin indent on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
vmap <BS> x

" general stuff
set encoding=utf-8
"set hidden          " make vim work like every other editor
set nobackup        " no backup files please
set history=50
set ruler           " show cursor position
set showcmd
set laststatus=2    " always show the status line
set autoindent
set smartindent
set nowrap          " don't wrap text
set showmatch       " show matching parens, etc
set matchtime=2     " show matching parens for 0.2 sec
set modelines=0     " turn off modelines (some security exploits)
set scrolloff=5     " scroll before the end of the page
set shortmess=aIoOt " short messages, no intro
set splitbelow      " new splits below existing
set tildeop         " use ~ like an operator
set autochdir       " automatically cd to the current file's dir
set clipboard=unnamed  " use the OS clipboard by default
"set nofsync
set laststatus=2

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

" disable middle-click paste
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>


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


" do syntax highlighting from the start of the file to avoid quirks
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
    hi Search guibg=#fcf75e
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
    autocmd FileType html setlocal ts=4 sts=4 sw=4 expandtab number
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

" ctrlp.vim
let g:ctrlp_map = '<Leader>]'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py|test'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
"nmap ; :CtrlPBuffer<CR>

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" powerline
let g:Powerline_symbols="fancy"

" nerdtree
nnoremap <leader>[ :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=1
"let g:NERDTreeMinimalUI=1

" Correct my fumblefingers. See http://blog.sanctum.geek.nz/vim-command-typos/ 
if has("user_commands")
    "command! -bang -nargs=? -complete=file E e<bang> <args>
    command! -bang -nargs=? -complete=file W w<bang> <args>
    command! -bang -nargs=? -complete=file Wq wq<bang> <args>
    command! -bang -nargs=? -complete=file WQ wq<bang> <args>
    "command! -bang Wa wa<bang>
    "command! -bang WA wa<bang>
    command! -bang Q q<bang>
    "command! -bang QA qa<bang>
    "command! -bang Qa qa<bang>
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

