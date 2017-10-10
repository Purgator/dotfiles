#!/bin/sh

#
# Usage : firefox_launcher.sh TARGET_DESKTOP [FIREFOX_PROFILE] [ACCURACY]
#
# TARGET_DESKTOP  : The desktop where to place Firefox. First one is 0.
#
# FIREFOX_PROFILE : (optionnal) Case sensitive. The profile to load.
#                   + use profile "Aymeric" by default.
#
# ACCURACY        : (optionnal) Lower value bring firefox faster to the
#                   + desirated desktop. Sometimes it can't be lower than 1.
#


target_desktop=${1-0}
firefox_profile="$(find "/home/$(whoami)/.mozilla/firefox/" -name "*\.${2-default}")"
accuracy=${3-1}

firefox -profile "$firefox_profile" &
pid="$!"
while [[ -z  "$(wmctrl -lp | grep $pid)" ]] ; do
	sleep $accuracy
done
#wmctrl -ia $(wmctrl -lp | grep $pid | cut -f 1 -d ' ')  -b add,skip_pager
#wmctrl -ia $(wmctrl -lp | grep $pid | cut -f 1 -d ' ')  -b toggle,maximized_vert,maximized_horz -t $target_desktop
 wmctrl -ia $(wmctrl -lp | grep $pid | cut -f 1 -d ' ') -t $target_desktop
