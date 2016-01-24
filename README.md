dotfiles.git
============
This repo contains dotfiles (.bashrc, .nanorc, .emacs.d/init.el, etc.) for Ubuntu Linux.

Clone and run this on a new EC2 instance running Ubuntu 12.04.2 LTS to
configure your the environment as follows:

```sh
cd $HOME

if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles~
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi

git clone https://github.com/startup-class/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sb dotfiles/.nanorc .
ln -sb dotfiles/dircolors.256dark ./.dircolors
ln -sf dotfiles/.emacs.d .
ln -sf dotfiles/.gitconfig .
ln -sf dotfiles/.gitignore .
```

Git notes
====
In .gitconfig, note that the `core.excludesfile` refers to `.gitignore` w/o path prefix. The files itself resides in the user's home directory (symbolic link to ~/dotfiles).
This way it should work out of the box on both Win and Linux, but if it does not, edit this line to be one of the following.

*nix:
```
git config --global core.excludesfile '~/.gitignore'
```

Windows:
```
git config --global core.excludesfile "%USERPROFILE%\.gitignore"
```

Note
====
This repo started as a modification of Stanford startup-class settings, and it should morph into my personal environment settings.

See also http://github.com/startup-class/setup to install prerequisite
programs. If all goes well, in addition to a more useful prompt, now you can
do `emacs -nw hello.js` and hitting `C-c!` to launch an interactive SSJS
REPL, among many other features. See the
[Startup Engineering Video Lectures 4a/4b](https://class.coursera.org/startup-001/lecture/index)
for more details.