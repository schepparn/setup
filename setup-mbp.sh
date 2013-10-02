#!/bin/bash
# Simple setup.sh for configuring the KIT MacBook Pro
# for headless setup. 

# Install Xcode from Apple store - no way to automate...

# Install MacPorts pkg from http://www.macports.org/install.php
# TODO Make this automated
echo "Manually install Xcode and MacPorts before running this script."

# Install git http://git-scm.com
sudo port install git-core +svn +doc +bash_completion +gitweb

# Install nvm: node-version manager
# https://github.com/creationix/nvm
cd $HOME
if ! [ -d .profile ]; then
    touch .profile
fi
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install 0.10
nvm use 0.10

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo port install rlwrap

# Install emacs24
# http://www.macports.org/ports.php?by=category&substr=emacs
sudo port install emacs

# Install Heroku toolbelt
# https://toolbelt.heroku.com/osx
# curl https://toolbelt.heroku.com/install.sh | sh
# Install pkg in order to get Foreman and git integration


# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/startup-class/dotfiles.git
ln -s dotfiles/.screenrc .
ln -s dotfiles/.bash_profile .
ln -s dotfiles/.bashrc .
ln -s dotfiles/.bashrc_custom .
ln -s dotfiles/.emacs.d .

