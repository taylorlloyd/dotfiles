#!/bin/bash

if [ -f "$HOME/.bashrc" ] && [ ! -L "$HOME/.bashrc" ]
then
    echo "Moving existing .bashrc to .bashrc.local"
    mv $HOME/.bashrc $HOME/.bashrc.local
fi
if [ -e "$HOME/.bashrc" ]
then
    echo "Removing previous .bashrc link"
    rm $HOME/.bashrc
fi
echo "Linking to dotfiles .bashrc"
ln -s `pwd`/.bashrc $HOME/.bashrc
echo "Done."


