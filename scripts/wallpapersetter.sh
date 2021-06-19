#Script for pulling a random wallpaper from the pi

DIR=$(ssh pi@apli-rb 'ls ~/wallpapers | shuf -n 1')
COMMAND="ls ~/wallpapers/$DIR/ | shuf -n 1"
FILE=$(ssh pi@apli-rb $COMMAND)

scp -i /home/aapeli/.ssh/id_rsa pi@apli-rb:~/wallpapers/$DIR/$FILE /tmp/$FILE
DISPLAY=:0 feh --bg-scale /tmp/$FILE
betterlockscreen -u /tmp/$FILE
