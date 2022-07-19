rm -rf ~/.config/nvim
rm ~/.bashrc
rm ~/.ideavimrc
rm ~/.inputrc
cp -rs ~/.dotfiles/nvim/ ~/.config/nvim/
ln .bashrc ~/.bashrc
ln .inputrc ~/.inputrc
ln .ideavimrc ~/.ideavimrc
