rm -rf ~/.config/nvim
rm -rf ~/.config/i3
rm -rf ~/.config/polybar
rm -rf ~/.config/rofi
rm -rf ~/.scripts
rm ~/.tmux.conf
rm ~/.bashrc
rm ~/.ideavimrc
rm ~/.inputrc
rm ~/.config/picom.conf
cp -rs ~/.dotfiles/nvim/ ~/.config/nvim/
cp -rs ~/.dotfiles/polybar/ ~/.config/polybar/
cp -rs ~/.dotfiles/i3/ ~/.config/i3/
cp -rs ~/.dotfiles/rofi/ ~/.config/rofi/
cp -rs ~/.dotfiles/.scripts/ ~/.scripts/
ln .bashrc ~/.bashrc
ln .inputrc ~/.inputrc
ln .ideavimrc ~/.ideavimrc
ln picom.conf ~/.config/picom.conf
ln .tmux.conf ~/.tmux.conf

chmod +x ~/.config/polybar/launch.sh
