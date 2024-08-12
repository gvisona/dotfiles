syntax on

set termguicolors
set background=dark
set term=xterm-256color
colorscheme selenized
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

Plug 'frazrepo/vim-rainbow'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'


call plug#end()

nnoremap <C-f> :Files<Cr>
nnoremap <C-g> :NERDTreeToggle<Cr>