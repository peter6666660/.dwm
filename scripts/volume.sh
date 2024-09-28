#!/bin/bash

# 获取静音状态
mute_status=$(amixer get Master | grep '\[on\]' | wc -l)

volume=$(amixer get Master | grep -o "[0-9]*%" | head -n 1)


# 判断是否静音
if [ "$mute_status" -eq 0 ]; then
    echo "🔇 Muted"  # 显示静音图标
else
    echo "🔊 $volume"  # 显示音量百分比
fi

