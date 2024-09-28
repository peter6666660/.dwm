#!/bin/bash

# 定义音量调整的增量
VOLUME_INCREMENT=5

# 获取当前静音状态
mute_status=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

case "$1" in
    up)
        # 增加音量
        pactl set-sink-volume @DEFAULT_SINK@ +${VOLUME_INCREMENT}%
        echo "Volume increased."
        ;;
    down)
        # 减少音量
        pactl set-sink-volume @DEFAULT_SINK@ -${VOLUME_INCREMENT}%
        echo "Volume decreased."
        ;;
    toggle)
        # 切换静音状态
        if [ "$mute_status" == "yes" ]; then
            pactl set-sink-mute @DEFAULT_SINK@ 0
            echo "Unmuted."
        else
            pactl set-sink-mute @DEFAULT_SINK@ 1
            echo "Muted."
        fi
        ;;
    *)
        echo "Usage: $0 {up|down|toggle}"
        exit 1
        ;;
esac

# 发送信号以更新状态栏（假设使用信号 10）
kill -44 $(pidof dwmblocks)
