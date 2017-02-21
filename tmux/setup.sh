
if [ -f "$HOME/.tmux.conf" ] && [ ! -L "$HOME/.tmux.conf" ]
then
    echo "Moving existing tmux.conf to tmux.conf.local"
    mv $HOME/.tmux.conf $HOME/.tmux.conf.local
else
    touch $HOME/.tmux.conf.local
fi
if [ -e "$HOME/.tmux.conf" ]
then
    echo "Removing previous .tmux.conf link"
    rm $HOME/.tmux.conf
fi
echo "Linking to dotfiles .tmux.conf"
ln -s `pwd`/.tmux.conf $HOME/.tmux.conf

echo "Done."
