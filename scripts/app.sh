#/bin/bash

prog=$(ls ~/.dmenu/ | dmenu -p "APP")

echo $prog

if [ "$prog" ]; then
	env $prog &
fi
