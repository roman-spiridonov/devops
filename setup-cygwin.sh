#!/bin/bash
# Set up symbolic links to dotfiles
# Assumes that ~/dotfiles folder and necessary files exist
cd $HOME

if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi


# Global
# Using hard links instead of symbolic for compatibility with Windows: http://stackoverflow.com/a/17996448/7213548
ln -b devops/dotfiles/dircolors.256dark ./.dircolors
ln -b devops/dotfiles/.gitconfig .
ln -b devops/dotfiles/.gitexcludes .
cp -aR devops/dotfiles/.emacs.d .

cp -aR devops/dotfiles/.mc .
cp ~/.mc/lib/mc-solarized-skin/solarized.ini /usr/share/mc/skins  # https://www.midnight-commander.org/wiki/ru/doc/common/skins 

# OS-specific
ln -b devops/dotfiles/cygwin/.bash_profile .
ln -b devops/dotfiles/cygwin/.bashrc .
ln -b devops/dotfiles/cygwin/.minttyrc .
ln -b devops/dotfiles/cygwin/.inputrc .
ln -b devops/dotfiles/cygwin/.profile .
ln -b devops/dotfiles/cygwin/.nanorc .

# Scripts
if ! [ -d bin ]; then
    mkdir bin
fi 
ln -b ~/devops/bin/activate ./bin/activate
ln -b ~/devops/bin/deactivate ./bin/deactivate
ln -b ~/devops/bin/intellij_diff.sh ./bin/intellij_diff.sh
ln -b ~/devops/bin/intellij_merge.sh ./bin/intellij_merge.sh

# Config files

# nginx
cp -aR devops/conf/nginx/ /etc/nginx/
if ! [ -d /var/lib/nginx/tmp ]; then  # known issue: tmp dir does not exist
    mkdir -p /var/lib/nginx/tmp
fi