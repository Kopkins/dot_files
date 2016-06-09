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

call vundle#end()

filetype plugin indent on

set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

let python_highlight_all=1
let mapleader=";"
syntax on
set ts=2
set sts=2
set sw=2
set tw=79
set modeline
set background=dark
set autoindent
set smartindent
set number
set expandtab
set splitbelow
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
set t_Co=256

map <Leader>n :bn<cr>
map <Leader>p :bp<cr>
map <Leader>d :bd<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
