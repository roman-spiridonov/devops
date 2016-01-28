About
====
This repo contains installation scripts for my personal VM.
The initial scrips were a fork of Stanford startup-class settings (http://github.com/startup-class/setup) for Ununtu VM, but as of today they were modified significantly and morphed into my personal environment settings.

Installation
============
The procedure depends on the OS:
* Ubuntu: 
```
cd $HOME
sudo apt-get install -y git-core
git clone https://github.com/roman-spiridonov/devops
chmod +x ./devops/setup-ubuntu.sh
./devops/setup-ubuntu.sh
```

* Windows (Cygwin):
	* Go to link: https://cygwin.com/install.html
	* Select packages: openssh, rsync, wget, git-core, zip+unzip
	* Install apt-cyg: https://code.google.com/p/apt-cyg/, https://github.com/transcode-open/apt-cyg
```	
lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg
install apt-cyg /bin
```

4. Set up user's home: /etc/passwd > set up user's home, group and bash. Hint: Use /cygdrive/c instead of /home/. 
5. Execute `~/devops/setup-cygwin.sh` to install totfiles. Note that the skeleton files reside in /etc/skel inside cygwin folder.
6. Set up $PATH env variable to not contain spaces. Use c:\progra~1 ("program files") and c:\progra~2 ("program files (x86)").
7. Make sure to include c:\cygwin64\bin in $PATH
8. SSH
```
 chmod u+rwx known_hosts # for system to store identified hosts public keys
 chmod 700 ~/.ssh # .ssh settings folder
 chmod 400 key.pem # private key
```
Create ~/.ssh/config folder like the following:
```
Host awshost
HostName 54.213.193.148
User ubuntu
IdentityFile ~/.ssh/key.pem
```
Finally, set up SSH on Git:
* Generate new key if necessary:
```
ssh-keygen -t rsa -b 4096 -C "your_email@example.com" #Creates a new ssh key, using the provided email as a label
```
* Add the key to SSH agent:
```
eval $(ssh-agent -s) #launch SSH agent
ssh-add ~/.ssh/cg_aws_spiridonov.pem  # add key
```


dotfiles
============
This folder contains dotfiles (.bashrc, .nanorc, .emacs.d/init.el, etc.) for Ubuntu Linux and Cygwin.

The folder structure is as follows:
* Common dotfiles (cross-OS) + Ubuntu: `/dotfiles/*`
* Cygwin-specific dotfiles: `/dotfiles/cygwin/*`

Clone and run this on a new EC2 instance running Ubuntu 12.04.2 LTS to
configure your the environment as follows:

```sh
cd $HOME

if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi

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
In .gitconfig, note that the `core.excludesfile` refers to `~/.gitignore`. This is the *nix way of defining the home directory.
If you are using these dotfiles on Win system, you may need sometimes to fix this to be the following.

*nix:
```
git config --global core.excludesfile '~/.gitignore'
```

Windows:
```
git config --global core.excludesfile "%USERPROFILE%\.gitignore"
```

Emacs
============
Do `emacs -nw hello.js` and hit `C-c!` to launch an interactive SSJS REPL, among many other features.


Scripts
============
This folder contains helpful scripts.
* `colortest.sh` - test color scheme after installing color packages (dircolors, solarized, etc.)

