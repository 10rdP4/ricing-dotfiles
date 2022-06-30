#!/bin/bash

CFILE=$HOME/.config/polybar/colors.ini


dark='#212f3c'
light='#fcfcfc'

current_color=`cat $CFILE | grep 'background' | sed 's/.*#/#/g'`

echo $current_color >> $HOME/.config/polybar/scripts/color.log
echo $dark >> $HOME/.config/polybar/scripts/color.log

if [[ "$current_color" == "$dark" ]]; then 
    sed -i -e "s/foreground = #.*/foreground = $dark/g" $CFILE
    sed -i -e "s/background = #.*/background = $light/g" $CFILE

else
    sed -i -e "s/foreground = #.*/foreground = $light/g" $CFILE
    sed -i -e "s/background = #.*/background = $dark/g" $CFILE
fi

polybar-msg cmd restart