if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
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
" Initialize plugin system
call plug#end()

" Move between open buffers.
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>


" Super fast window movement shortcuts
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l


let mapleader=","           " Set the leader
set encoding=utf8           " Show glyphs
set showcmd                 " Show the current cmd in the status bar
set directory-=.            " Don't store temp files in cwd
set autoindent              " Carry over indenting from previous lineu

set hidden                  " Don't prompt to save hidden windows until exit
set history=200             " How many lines of history to save
set hlsearch                " Hilight searching
set ignorecase              " Case insensitive
set incsearch               " Search as you type
set nobackup                " No backups left after done editing
set showbreak=              " Show for lines that have been wrapped, like Emac
set textwidth=100           " 100 is the new 80

" Essential for filetype plugins.
filetype plugin indent on

map <Leader>n :NERDTreeToggle<CR>

" if !has("gui_running")
"     set t_Co=256
"     set term=xterm-256color
" endif

if globpath(&runtimepath, 'colors/solarized.vim', 1) !=# ''
  " Enable dark or light
  set background=dark
  colorscheme solarized
endif
