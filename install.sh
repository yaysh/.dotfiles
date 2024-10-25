sudo apt-get update && sudo apt-get upgrade
sudo apt-get install ripgrep -y
sudo apt-get install wget -y
sudo apt install lm-sensors -y
sudo apt-get install fonts-powerline -y
sudo apt-get install i3 -y
sudo apt-get install playerctl -y
sudo apt-get install polybar -y
sudo apt-get install tmux -y
sudo apt-get install rofi -y
sudo apt-get install flameshot -y
sudo apt-get install curl -y
sudo apt-get install fuse -y
sudo apt-get install picom -y
sudo apt-get install xclip -y
sudo apt-get install feh -y
sudo apt-get install flameshot -y
# remove menubar from terminal
gsettings set org.gnome.Terminal.Legacy.Settings headerbar false
gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar false
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip
unzip JetBrainsMono.zip -d ~/.fonts
fc-cache -fv
sudo apt-get install --reinstall gnome-control-center -y
sudo sh ./after_git.sh


