#/bin/sh
xfce4-screenshooter -r -o cat | convert -resize 300% - - | tesseract -l fra stdin stdout | xclip -selection clipboard
