dotfiles.git
============
This repo contains dotfiles (.bashrc, .nanorc, .emacs.d/init.el, etc.) for Ubuntu Linux.

Clone and run this on a new EC2 instance running Ubuntu 12.04.2 LTS to
configure your the environment as follows:

```sh
cd $HOME
git clone https://github.com/startup-class/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sb dotfiles/.nanorc .
ln -sb dotfiles/dircolors.256dark ./.dircolors
mv .emacs.d .emacs.d~
ln -s dotfiles/.emacs.d .
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