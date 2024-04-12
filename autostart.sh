!/bin/bash

picom -b
dwmblocks &

# 笔记本屏幕自动适应                   HDMI-1 2048*1080  位于 笔记本的左边
xrandr --output LVDS-1 --auto --output HDMI-1 --mode 2048x1080 --left-of LVDS-1

while true; do
	feh --bg-fill --no-fehbg --randomize -z ~/Pictures/*

	#  xsetroot -name "$(acpi -b | awk '{print $3, $4}') | $(date +'%F %R')"
	sleep 60
done
