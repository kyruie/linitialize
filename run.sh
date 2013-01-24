#!/bin/bash
#

# install vundle
#
git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# create .vimrc & install powerline
#
cat vimrc > ~/.vimrc
vi +BundleInstall +qall

# install tmux-powerline
#
git clone git://github.com/erikw/tmux-powerline ~/.tmux-powerline

# create .tmux.conf
#
cat tmux.conf > ~/.tmux.conf

# set default tmux-powerline settgins
#
~/.tmux-powerline/generate_rc.sh
mv ~/.tmux-powerlinerc.default ~/.tmux-powerlinerc

# install powerline-bash
#
git clone git://github.com/milkbikis/powerline-shell ~/.powerline-shell

if [[ ! `cat ~/.bashrc | grep _update_ps1` ]]; then
echo '
function _update_ps1()
{
	export PS1="$(~/.powerline-shell/powerline-shell.py $?)"
}

export PROMPT_COMMAND="_update_ps1"
' | bash -c "cat - >> ~/.bashrc"
fi

source ~/.bashrc
