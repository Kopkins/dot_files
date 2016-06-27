set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'SuperTab'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()

filetype plugin indent on

" airline config
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set encoding=utf-8
set t_Co=256

" you complete me config
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
set tags=tags,~/valhalla/tags

let python_highlight_all=1
let mapleader=";"
syntax on
set ts=2
set sts=2
set sw=2
set tw=80
set modeline
set background=dark
set autoindent
set copyindent
set smartindent
set number
set expandtab
set splitbelow
set showmatch
set matchtime=2
set scrolloff=3
set ignorecase
set smartcase
set undofile
set cursorline
set mouse=i

" Key maps
map <Leader>n :bn<cr>
map <Leader>p :bp<cr>
map <Leader>d :bd<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
