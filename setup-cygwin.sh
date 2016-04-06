#!/bin/bash
# Set up symbolic links to dotfiles
# Assumes that ~/dotfiles folder and necessary files exist
cd $HOME

if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi


# Global
ln -sb devops/dotfiles/.nanorc .
ln -sb devops/dotfiles/dircolors.256dark ./.dircolors
ln -sb devops/dotfiles/.gitconfig .
ln -sb devops/dotfiles/.gitexcludes .
ln -sf devops/dotfiles/.emacs.d .

cp devops/dotfiles/.mc .
cp ~/.mc/lib/mc-solarized-skin/solarized.ini /usr/share/mc/skins  # https://www.midnight-commander.org/wiki/ru/doc/common/skins 

# OS-specific
ln -sb devops/dotfiles/cygwin/.bash_profile .
ln -sb devops/dotfiles/cygwin/.bashrc .
ln -sb devops/dotfiles/cygwin/.minttyrc .
ln -sb devops/dotfiles/cygwin/.inputrc .
ln -sb devops/dotfiles/cygwin/.profile .
