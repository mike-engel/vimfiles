set nocompatible " Use Vim settings rather than Vi
filetype off " required for vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'bling/vim-airline'
Plugin 'danro/rename.vim'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/tComment'
Plugin '1995eaton/vim-better-css-completion'
Plugin '1995eaton/vim-better-javascript-completion'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'airblade/vim-gitgutter'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'fatih/vim-go'
Plugin 'golangtw/gocode.vim'
Plugin 'gregsexton/MatchTag'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'zhaocai/GoldenView.Vim'
Plugin 'terryma/vim-multiple-cursors'

Bundle 'chriskempson/base16-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" NERDTree config
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" airline config
let g:airline_powerline_fonts=1
let g:airline_theme='base16'

" ultisnips config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" mappings
let mapleader=","
nmap <silent> <leader>ev :e $MYVIMRC<CR> " some remappings to edit vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR> " some remappings to reload vimrc
nnoremap ; : " remap command leader to ;
nnoremap j gj " remap BOL command
nnoremap k gk " remap EOL command
nnoremap <Tab> % " remap % to tab key
vnoremap <Tab> % " remap % to tab key
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR> " remove whitespace on save
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" GoldenView.vim
" 1. split to tiled windows
nmap <silent> <C-L>  <Plug>GoldenViewSplit

" 2. quickly switch current window with the main pane
" and toggle back
nmap <silent> <F8>   <Plug>GoldenViewSwitchMain
nmap <silent> <S-F8> <Plug>GoldenViewSwitchToggle

" 3. jump to next and previous window
nmap <silent> <C-N>  <Plug>GoldenViewNext
nmap <silent> <C-P>  <Plug>GoldenViewPrevious

" colors
set t_Co=256
set background=dark
colorscheme base16-ocean
syntax on " turn on syntax highlighting

" HUD
set number " always show line numbers
set nowrap
set splitbelow " create new panes underneath the current one
set splitright " create new panes to the right of the current one
set ruler " ruler at bottom right of window
set laststatus=2 " enable status line

" whitespace
set tabstop=4 " a tab is two spaces
set autoindent " autoindentins is always on
set shiftwidth=4 " indenting is always 2 spaces
set shiftround
set showmatch " show matching parentheses

" searching
set ignorecase " ignore case when searching
set smartcase " ignore case if search pattern is all lowercase, upcase, etc
set smarttab " insert tabs on the start of a line based on shiftwidth
set nohlsearch " highlight search terms
set incsearch " show search matches as you type

" memory
set history=1000 " increase history levels
set undolevels=1000 " increase undo levels
set nobackup " no vimbackups
set noswapfile " no vim swap file

" tab completion
set wildmenu " command completion
set wildmode=list:full " full list for command completion
set list listchars=tab:»·,trail:·

" scroll
set scrolloff=3

" misc
set backspace=indent,eol,start " enable backspace while in insert mode
set encoding=utf-8
set esckeys!
set backupdir=~/.vim/backups,.
set directory=~/.vim/swaps,.
set shell=zsh
if exists('&undodir')
	set undodir=~/.vim/undo,.
endif

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "'

	" ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0
endif

