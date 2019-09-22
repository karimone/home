"*************************************
"*  _       _ _         _            *
"* (_)_ __ (_) |___   _(_)_ __ ___   *
"* | | '_ \| | __\ \ / / | '_ ` _ \  *
"* | | | | | | |_ \ V /| | | | | | | *
"* |_|_| |_|_|\__(_)_/ |_|_| |_| |_| *
"*                                   *
"*************************************

colorscheme elflord
let mapleader = ","

" Install the vim-plug if is not present
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
"Plug 'junegunn/goyo.vim'
Plug 'scrooloose/nerdtree'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'jreybert/vimagit'
Plug 'vimwiki/vimwiki'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'vifm/vifm.vim'
Plug 'kien/ctrlp.vim'
Plug 'jeetsukumaran/vim-buffergator'
call plug#end()

set bg=light
set go=a
set mouse=a
set scrolloff=999  " keeps the cursor vertically allined
set nohlsearch
set clipboard=unnamedplus
set noswapfile
set autowrite "save buffers automatically when switching

" Tabs as a ninja
set tabstop=4
set shiftwidth=4
set expandtab

map <F2> :NERDTreeToggle<CR>
map <F4> :BuffergatorToggle<CR>
map <leader>r :echo "reloading vimrc..."<CR>:so $MYVIMRC<CR>

" nice navigation
map <a-h> :bp<cr>
map <a-l> :bn<cr>
map <a-H> :bfirst<cr>
map <a-L> :blast<cr>
map <a-x> :bdelete<cr>

" use the clipboard 
noremap <leader>y "+y
noremap <leader>Y "+Y
noremap <leader>p "+p
noremap <leader>P "+P
noremap <leader>q :bdelete<CR>

" Some basics:
nnoremap c "_c
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
vnoremap <C-c> "+y
map <C-p> "+P

" vim-airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

" Save the file as sudo
cmap w!! w !sudo tee > /dev/null %

