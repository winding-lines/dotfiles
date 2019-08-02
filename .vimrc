set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'jremmen/vim-ripgrep'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'GEverding/vim-hocon'
" Initialize plugin system
call plug#end()

" Essential for filetype plugins.
filetype plugin indent on



for rcfile in split(globpath("~/.vim/rc", "*.vim"), '\n') 
    execute('source '.rcfile)
endfor


" if !has("gui_running")
"     set t_Co=256
"     set term=xterm-256color
" endif

