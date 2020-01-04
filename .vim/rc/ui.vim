
if globpath(&runtimepath, 'colors/solarized.vim', 1) !=# ''
  " Enable dark or light
  set background=dark
  colorscheme solarized
endif

" enable mouse and clipboard copy unless tmux or unix
if !exists('$TMUX') && !has('unix')
  set mouse=a
  set clipboard=unnamed
endif
