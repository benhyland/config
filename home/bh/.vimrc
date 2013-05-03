set nocompatible
set nomodeline

set backspace=indent,eol,start

syntax on
set hlsearch
set ruler

set autoindent

if has('mouse')
  set mouse=a
endif

filetype indent plugin on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

noremap  <F11> :%retab!<return>
inoremap <F11> <c-o>:%retab!<return>

noremap  <F12> :w<return>
inoremap <F12> <c-o>:w<return>
