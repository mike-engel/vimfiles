set nocompatible " changes some weird options below?

call pathogen#helptags() " pathogen init
call pathogen#incubate() " pathogen init
let mapleader="," " change leader key to , from \
nmap <silent> <leader>ev :e $MYVIMRC<CR> " some remappings to edit vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR> " some remappings to reload vimrc

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
set backspace=indent,eol,start " enable backspace while in inset mode
set ruler " ruler at bottom right of window
set mouse=a

autocmd vimenter * if !argc() | NERDTree | endif " auto open NERDTree

nnoremap ; : " remap command leader to ;
nnoremap j gj " remap BOL command
nnoremap k gk " remap EOL command
nnoremap <Tab> % " remap % to tab key
vnoremap <Tab> % " remap % to tab key
nnoremap <Space> za " remap za to space key
vnoremap <Space> za " remap za to space key
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR> " remove whitespace on save

filetype on " enable filetypes reading
filetype plugin on " enable plugins
filetype indent on " ???

syntax on " turn on syntax highlighting
set background=dark " dark background for solarized
colorscheme base16-ocean " use ocean
