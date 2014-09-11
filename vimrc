set nocompatible " be iMproved, required
filetype off " required for vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'bling/vim-airline'

Bundle 'chriskempson/base16-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:airline_powerline_fonts=1
let g:airline_theme='base16'
let mapleader="," " change leader key to , from \
nmap <silent> <leader>ev :e $MYVIMRC<CR> " some remappings to edit vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR> " some remappings to reload vimrc
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

set number " always show line numbers
set tabstop=2 " a tab is two spaces
set autoindent " autoindentins is always on
set shiftwidth=2 " indenting is always 2 spaces
set showmatch " show matching parentheses
set ignorecase " ignore case when searchin
set smartcase " ignore case if search pattern is all lowercase, upcase, etc
set smarttab " insert tabs on the start of a line based on shiftwidth
set hlsearch " highlight search terms
set incsearch " show search matches as you type
set history=1000 " increase history levels
set undolevels=1000 " increase undo levels
set nobackup " no vimbackups
set noswapfile " no vim swap file
set laststatus=2 " enable status line
set wildmenu " command completion
set wildmode=list:full " full list for command completion
set backspace=indent,eol,start " enable backspace while in insert mode
set ruler " ruler at bottom right of window
set encoding=utf-8
set t_Co=256
set background=dark

colorscheme base16-ocean

nnoremap ; : " remap command leader to ;
nnoremap j gj " remap BOL command
nnoremap k gk " remap EOL command
nnoremap <Tab> % " remap % to tab key
vnoremap <Tab> % " remap % to tab key
nnoremap <Space> za " remap za to space key
vnoremap <Space> za " remap za to space key
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR> " remove whitespace on save

syntax on " turn on syntax highlighting
