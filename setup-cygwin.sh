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
ln -sb devops/dotfiles/.gitignore .

# OS-specific
ln -sb devops/dotfiles/cygwin/.bash_profile .
ln -sb devops/dotfiles/cygwin/.bashrc .
ln -sb devops/dotfiles/cygwin/.minttyrc .
ln -sb devops/dotfiles/cygwin/.inputrc .
ln -sb devops/dotfiles/cygwin/.profile .
