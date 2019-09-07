set nocompatible

call plug#begin('~/.vim/plugged')
" Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'jremmen/vim-ripgrep'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
" Initialize plugin system
call plug#end()

" Essential for filetype plugins.
filetype plugin indent on
set encoding=UTF-8


for rcfile in split(globpath("~/.vim/rc", "*.vim"), '\n') 
    execute('source '.rcfile)
endfor

