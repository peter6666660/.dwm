!/bin/bash
picom -b

# 状态栏
dwmblocks &

connected=$(xrandr | grep " connected" | awk '{print $1}')


# 内建屏幕
internal_dispaly="LVDS-1"
# 内建屏幕
external_dispaly="HDMI-1"

if echo "$connected" | grep -q "$external_dispaly"; then
 xrandr --output "$internal_dispaly" --auto --output "$external_dispaly" --mode 2048x1080 --left-of LVDS-1
else
  xrandr --output "$internal_dispaly" --auto --output "$external_dispaly" --off
fi

# 笔记本屏幕自动适应                   HDMI-1 2048*1080  位于 笔记本的左边
# xrandr --output LVDS-1 --auto --output HDMI-1 --mode 2048x1080 --left-of LVDS-1
# 镜像方式
# xrandr --output HDMI-1 --mode 2048x1080 --auto --output LVDS-1 --auto --same-as HDMI-1 --auto

while true; do
	feh --bg-fill --no-fehbg --randomize -z ~/Pictures/*
	sleep 60
done
