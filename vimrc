set nocompatible " Use Vim settings rather than Vi
filetype off " required for vundle
filetype plugin indent off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle
Plugin 'gmarik/Vundle.vim'

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------
" GUI
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
" Plugin 'zhaocai/GoldenView.Vim'
Plugin 'terryma/vim-multiple-cursors'

" General
Plugin 'kien/ctrlp.vim'
Plugin 'danro/rename.vim'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'editorconfig/editorconfig-vim'

" Typing
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/tComment'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'gregsexton/MatchTag'

" CSS
Plugin '1995eaton/vim-better-css-completion'
Plugin 'hail2u/vim-css3-syntax'

" JS
Plugin '1995eaton/vim-better-javascript-completion'
Plugin 'jelera/vim-javascript-syntax'

" Go
Plugin 'fatih/vim-go'
Plugin 'golangtw/gocode.vim'

" Markdown
Plugin 'plasticboy/vim-markdown.git'

Bundle 'chriskempson/base16-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" -----------------------------------------------------------------------------
" mappings
" -----------------------------------------------------------------------------
let mapleader=","

" some remappings to edit vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" remap command leader to ;
nnoremap ; :

" Make j and k act normally for wrapped lines
nnoremap j gj
nnoremap k gk

" remap % to tab key
nnoremap <Tab> %
vnoremap <Tab> %

" remove whitespace on save
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" window navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" visual shifting
vnoremap < <gv
vnoremap > >gv

" yank from the cursor to the end of the line
nnoremap Y $y

" allow repeat in visual mode
vnoremap . :normal .<CR>

" resize splits equally
map <leader>= <c-W>=

" easier newlines
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" -----------------------------------------------------------------------------
" buffers
" -----------------------------------------------------------------------------
" open a new empty buffer
nmap <leader>T :enew<cr>

" move to the next buffer
nmap <leader>l :bnext<CR>

" move to the previous buffer
nmap <leader>h :bprevious<CR>

" close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>

" show all open buffers and their status
nmap <leader>b1 :ls<CR>

" -----------------------------------------------------------------------------
" colors
" -----------------------------------------------------------------------------
set t_Co=256
set background=dark
colorscheme base16-ocean

" -----------------------------------------------------------------------------
" GUI
" -----------------------------------------------------------------------------
" always show line numbers
set number
set nowrap
set textwidth=0
set wrapmargin=0

" create new panes to the right or underneath the current one
set splitbelow
set splitright

" ruler at bottom right of window
set ruler

" enable status line
set laststatus=2
set showmode

" highlight current line
set cursorline
highlight clear SignColumn
highlight clear LineNrlet

" easier h/l movement
set whichwrap=h,l,~,[,]

" -----------------------------------------------------------------------------
" whitespace
" -----------------------------------------------------------------------------
" a tab is four spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set nojoinspaces
set shiftround

" autoindentins is always on
set autoindent
set smartindent

" show matching parentheses
set showmatch

" highlight bad whitespace
set list
set listchars=tab:›\ ,trail:•,extends:>,nbsp:.

" -----------------------------------------------------------------------------
" searching
" -----------------------------------------------------------------------------
" ignore case when searching
set ignorecase

" ignore case if search pattern is all lowercase, upcase, etc
set smartcase

" insert tabs on the start of a line based on shiftwidth
set smarttab

" highlight search terms
set nohlsearch

" show search matches as you type
set incsearch

" -----------------------------------------------------------------------------
" memory
" -----------------------------------------------------------------------------
" increase history levels
set history=1000

" increase undo levels
set undolevels=1000

" -----------------------------------------------------------------------------
" tab completion
" -----------------------------------------------------------------------------
" command completion
set wildmenu

" full list for command completion
set wildmode=list:full
set wildignore=*.swp,*.bak,*.pyc,*.class
set complete-=i
set list listchars=tab:»·,trail:·

" -----------------------------------------------------------------------------
" scroll
" -----------------------------------------------------------------------------
" scrolling offset
set scrolloff=3

" easier scrolling
set nostartofline

" -----------------------------------------------------------------------------
" misc
" -----------------------------------------------------------------------------
set encoding=utf-8
set esckeys!
set shell=zsh

" lower timeout after typing leader
set ttimeout
set ttimeoutlen=500

" match brackets
set showmatch

" os x backspace fix
set backspace=indent,eol,start
set modelines=0
fixdel

" backups
set noswapfile
set backup
set backupdir=~/.vim/.backups
set directory=~/.vim/.tmp

" better undos
if has('persistent_undo')
	set undofile
	set undodir=~/.vim/.undo
	set undolevels=200
	set undoreload=200
endif

" code folding
set nofoldenable
set foldmethod=indent
set foldnestmax=10

" allow edited buffers that aren't visible in the window
set hidden

" -----------------------------------------------------------------------------
" silver searcher
" -----------------------------------------------------------------------------
if executable('ag')
	" Use Ag over Grep
	set grepprg=ag\ --nogroup\ --nocolor

	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g "'

	" ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0

	" better ack shortcut
	nnoremap <leader>f :Ag!<space>-i<space>-Q<space>
endif

" -----------------------------------------------------------------------------
" NERDTree config
" -----------------------------------------------------------------------------
let NERDTreeIgnore=['\.rbc$', '\~$', '\.dSYM$', '\.DS_Store']
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeChDirMode=1
let NERDTreeMouseMode=1
let NERDTreeShowHidden=1

map <leader>n :NERDTreeToggle<CR>

if has("autocmd")
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
endif

if isdirectory(argv(0))
    bd
    autocmd vimenter * exe "cd" argv(0)
    autocmd VimEnter * NERDTree
endif

" -----------------------------------------------------------------------------
" airline config
" -----------------------------------------------------------------------------
let g:airline_powerline_fonts=1
let g:airline_enable_branch=0
let g:airline_enable_syntastic=0
let g:airline#extensions#syntastic#enabled=0
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

" -----------------------------------------------------------------------------
" ultisnips config
" -----------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" -----------------------------------------------------------------------------
" vim css3 syntax
" -----------------------------------------------------------------------------
if has("autocmd")
	autocmd!
	autocmd FileType css setlocal iskeyword+=-
endif

" -----------------------------------------------------------------------------
" auto commands
" -----------------------------------------------------------------------------
if has("autocmd")
	autocmd!

	" Turn on spell check for certain filetypes automatically
	autocmd BufRead,BufNewFile *.md,*.markdown setlocal spell spelllang=en_us
	autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us
	autocmd FileType gitcommit setlocal spell spelllang=en_us

	" Autowrap text to 80 chars for certain filetypes
	autocmd BufRead,BufNewFile *.md,*.markdown setlocal textwidth=80
	autocmd BufRead,BufNewFile *.txt setlocal textwidth=80
	autocmd FileType gitcommit setlocal textwidth=80
endif

" -----------------------------------------------------------------------------
" vim-javascript
" -----------------------------------------------------------------------------
let g:javascript_enable_domhtmlcss=1

" -----------------------------------------------------------------------------
" CtrlP
" -----------------------------------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" -----------------------------------------------------------------------------
" footer
" -----------------------------------------------------------------------------
filetype plugin indent on
syntax on

