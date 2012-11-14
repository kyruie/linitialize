#!/bin/bash
#

# install vundle
#
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# create .vimrc
#
(cat <<EOF
set nu
set ts=3
set background=dark

set t_Co=256
set laststatus=2
let g:Powerline_symbols='fancy'

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'

filetype plugin indent on
EOF
) | bash -c "cat - > ~/.vimrc"

vi +BundleInstall +qall

# install powerline-bash
#
git clone https://github.com/milkbikis/powerline-bash ~/.powerline-bash

if [[ ! "cat ~/.bashrc | grep _update_ps1" ]]; then
(cat <<'EOF'

function _update_ps1()
{
	export PS1="$(~/.powerline-bash/powerline-bash.py $?)"
}

export PROMPT_COMMAND="_update_ps1"
EOF
) | bash -c "cat - >> ~/.bashrc"
fi

source ~/.bashrc
