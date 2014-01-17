#!/bin/sh

VUNDLE=~/test/vim/bundle/vundle


# Link vimrc if not allready existing
if [ ! -f ~/.vimrc ]; then
    echo "Linking .vimrc"
    ln -s ~/.vim/vimrc ~/.vimrc
else
    echo ".vimrc is allready existing"
    exit 1
fi

# install vundle if not allready present
if [ ! -d "$VUNDLE" ]; then
    echo "Installing Vundle"
    git clone https://github.com/gmarik/vundle.git "$VUNDLE"
else
    echo "Vundle allready installed"
    exit 1
fi
vim +BundleInstall +qall
