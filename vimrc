set nu
set ts=3
set sw=3
set et
set bg=dark

set t_Co=256
set ls=2

let g:Powerline_symbols='fancy'

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'

filetype plugin indent on
