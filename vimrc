set nocompatible
filetype off

" set the runtimepath
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Typing
" Changing surrounding quotes
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-scripts/tComment'

" Meta
Plugin 'wincent/terminus'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'danro/rename.vim'
Plugin 'easymotion/vim-easymotion'

" Code quality
Plugin 'vim-scripts/PreserveNoEOL'
Plugin 'scrooloose/syntastic'
Plugin 'prettier/vim-prettier'

" HTML5
Plugin 'othree/html5.vim'

" JS
Plugin 'jelera/vim-javascript-syntax'

" CSS
Plugin 'hail2u/vim-css3-syntax'

" Markdown
Plugin 'plasticboy/vim-markdown.git'

" Theme
Bundle 'chriskempson/base16-vim'
Bundle 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on

""
"" Mappings
""
let mapleader=" "
vnoremap < <gv
vnoremap > >gv
""
"" Buffers
""
" open a new empty buffer
nmap <leader>T :enew<cr>

" move to the next buffer
nmap <leader>l :bnext<cr>

" move to the previous buffer
nmap <leader>h :brevious<cr>

" close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<cr>

" show all open buffers and their status
nmap <leader>bl :ls<cr>

" close the last buffer and display an empty buffer
nmap <leader>bw :silent! bp<BAR>sp<BAR>silent! bn<BAR>bd<cr>

" prevent the stupid q: window from opening
nmap q: :q

""
"" Colors
""
set t_Co=256
set background=dark
"" colorscheme base16-ocean
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

""
"" GUI
""
set number " line numbers
set ruler " add a ruler to the bottom right
set laststatus=2
set showmode
set cursorline
set cursorcolumn
set whichwrap=h,l,~,[,]

""
"" Whitespace
""
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set nojoinspaces
set shiftround
set autoindent
set smartindent
set showmatch
set list
set listchars=tab:>-,trail:·
set nofoldenable
set nopaste
let g:PreserveNoEOL=1 " Preserve new line at end of file
autocmd BufWritePre * :call StripTrailingWhitespace()

""
"" Searching
""
set ignorecase
set smartcase
set smarttab
set nohlsearch
set incsearch

""
"" Memory
""
set history=1000
set undolevels=1000

""
"" Scrolling
""
set scrolloff=3
set nostartofline

""
"" Misc
""
set encoding=utf-8
set esckeys!
set shell=bash
set hidden
set backspace=indent,eol,start
set modelines=0
set timeout timeoutlen=3000 ttimeoutlen=100
fixdel

""
"" Backups
""
set noswapfile
set backup
silent execute '!mkdir -p ~/.vim/.backups'
silent execute '!mkdir -p ~/.vim/.tmp'
set backupdir=~/.vim/.backups
set directory=~/.vim/.tmp

""
"" Undos
""
if has('persistent_undo')
  set undofile
  silent execute '!mkdir -p ~/.vim/.undo'
  set undodir=~/.vim/.undo
  set undolevels=200
  set undoreload=200
endif

""
"" Silver Searcher (Ag)
""
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

""
"" Airline config
""
let g:airline_powerline_fonts=1
let g:airline_theme='base16'
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

""
"" CSS Syntax
""
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

""
"" JS Syntax
""
let g:javascript_enable_domhtmlcss=1
au BufNewFile,BufRead *.ejs set filetype=html

""
"" CtrlP
""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

""
"" Helper functions
""
fun! StripTrailingWhitespace()
  " don't strip on these filetypes
  if &ft =~ 'modula2\|markdown'
    return
  endif

  %s/\s\+$//e
endfun

""
"" Wrapup
""
syntax on
