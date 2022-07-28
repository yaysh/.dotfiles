rm -rf ~/.config/nvim
rm -rf ~/.config/i3
rm -rf ~/.config/polybar
rm ~/.bashrc
rm ~/.ideavimrc
rm ~/.inputrc
cp -rs ~/.dotfiles/nvim/ ~/.config/nvim/
cp -rs ~/.dotfiles/polybar/ ~/.config/polybar/
cp -rs ~/.dotfiles/i3/ ~/.config/i3/
ln .bashrc ~/.bashrc
ln .inputrc ~/.inputrc
ln .ideavimrc ~/.ideavimrc
