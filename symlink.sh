mkdir -p ~/.config/nvim
mv -f .bashrc ~/.bashrc
mv -f init.vim ~/.config/nvim/init.vim
mv -f .ideavimrc ~/.ideavimrc

ln ~/.bashrc .bashrc
ln ~/.config/nvim/init.vim init.vim
ln ~/.ideavimrc .ideavimrc
