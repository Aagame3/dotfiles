#Script for pulling a random wallpaper from the pi

DIR=$(ssh pi@apli-rb 'ls ~/wallpapers | shuf -n 1')
COMMAND="ls ~/wallpapers/$DIR/ | shuf -n 1"
FILE=$(ssh pi@apli-rb $COMMAND)

scp pi@apli-rb:~/wallpapers/$DIR/$FILE /tmp/$FILE
feh --bg-scale /tmp/$FILE
