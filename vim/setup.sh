
if [ -f "$HOME/.vimrc" ] && [ ! -L "$HOME/.vimrc" ]
then
    echo "Moving existing .vimrc to .vimrc.local"
    mv $HOME/.vimrc $HOME/.vimrc.local
fi
if [ -e "$HOME/.vimrc" ]
then
    echo "Removing previous .vimrc link"
    rm $HOME/.vimrc
fi
echo "Linking to dotfiles .vimrc"
ln -s `pwd`/.vimrc $HOME/.vimrc
if [ -f "$HOME/.vim/bundle/Vundle.vim/" ]
then
    echo "Installing Vundle"
    git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi
echo "Updating ViM plugins"
vim -c "PluginInstall" -c "q" -c "q"
echo "Done."
