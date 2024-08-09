syntax on

set termguicolors
set background=dark
set term=xterm-256color
colorscheme solarized
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set laststatus=2
"set colorcolumn=80
set number
set nocompatible
filetype on
filetype plugin on
filetype indent on
set cursorline
set ignorecase
set smartcase
set hlsearch
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
"highlight ColorColumn ctermbg=1 

call plug#begin('~/.vim/plugged')

"Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'frazrepo/vim-rainbow'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'scrooloose/syntastic'
"Plug 'itchyny/lightline.vim'


call plug#end()
