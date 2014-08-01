 install monaco font
cd ~/tmp
wget http://www.gringod.com/wp-upload/MONACO.TTF
sudo cp MONACO.TTF /usr/share/fonts/truetype/
git clone https://github.com/pdf/ubuntu-mono-powerline-ttf.git ~/.fonts/ubuntu-mono-powerline-ttf
sudo fc-cache -f -v
