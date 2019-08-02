
if globpath(&runtimepath, 'colors/solarized.vim', 1) !=# ''
  " Enable dark or light
  set background=dark
  colorscheme solarized
endif

" enable mouse and clipboard copy
set mouse=a
set clipboard=unnamed
