#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install curl 
sudo apt-get update
sudo apt-get install -y curl

# Install C compiler gcc and the build tool make
sudo apt-get install -y make gcc g++

# Install python
sudo apt-get install -y python-software-properties python

# Install sqlite by compiling from sources (for the current user)
# Update the version as needed: http://www.sqlite.org/download.html
sqlite_targz=sqlite-autoconf-3100200.tar.gz

mkdir ~/downloads; cd ~/downloads
wget http://www.sqlite.org/2016/$sqlite_targz
tar -xzvf $sqlite_targz
cd ${sqlite_targz%.*.*}

# Compile and build from source
./configure --prefix=$HOME/sqlite #install into home dir
make
make install

sudo ldconfig -v # tell the system that new libraries are available

mkdir ~/bin; cd ~/bin # Current user's binaries
ln -s ../sqlite/bin/sqlite3 . # Link sqlite3 to ~/bin
cd
export PATH=$HOME/bin:$PATH

which sqlite3

# **** NVM from sources ****
# Install nvm: node-version manager
# https://github.com/creationix/nvm
# 
# curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
# source $HOME/.nvm/nvm.sh
# nvm install v0.10.12
# nvm use v0.10.12
# **************************

# Install nodejs and nvm
sudo add-apt-repository ppa:chris-lea/node.js # add repo for apt-get to search
sudo apt-get update # update to make aware of new repos
sudo apt-get install -y nodejs # now install 
# Check with npm --version and node --version
npm --version
node --version

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
sudo npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg
# Note: nox is for console

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

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

ln -sf devops/dotfiles/.emacs.d .

# OS-specific
ln -sb devops/dotfiles/.bash_profile .
ln -sb devops/dotfiles/.bashrc .
ln -sb devops/dotfiles/.bashrc_custom .
ln -sb devops/dotfiles/.screenrc .
