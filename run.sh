#!/bin/bash
#

# install vundle
#
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# create .vimrc & install powerline
#
cat vimrc > ~/.vimrc
vi +BundleInstall +qall

# install tmux-powerline
#
git clone https://github.com/erikw/tmux-powerline ~/.tmux-powerline

# create .tmux.conf
cat tmux.conf > ~/.tmux.conf

# install powerline-bash
#
git clone https://github.com/milkbikis/powerline-bash ~/.powerline-bash

if [[ ! `cat ~/.bashrc | grep _update_ps1` ]]; then
echo '
function _update_ps1()
{
	export PS1="$(~/.powerline-bash/powerline-bash.py $?)"
}

export PROMPT_COMMAND="_update_ps1"
' | bash -c "cat - >> ~/.bashrc"
fi

source ~/.bashrc
