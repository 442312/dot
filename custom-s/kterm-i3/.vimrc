" Show line numbers
set number

" Tabs as spaces
set expandtab

" One tab means 2 spaces
set tabstop=2

" Highlight search results
set hlsearch

" Enable incremental search
set incsearch

" Use system clipboard
set clipboard=unnamedplus

" Set color scheme
colors kterm 

" Enable syntax highlight
syntax on

" Font for gVim
set guifont=terminus

" Hide toolbar for gVim
set guioptions -=T

" Remove scrollbar for gVim
set guioptions -=r

" Enable plugins
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

call plug#end()

" Keybinds
map <C-n> :NERDTreeToggle<CR>
