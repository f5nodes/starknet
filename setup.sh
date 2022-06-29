#!/bin/bash

node_install=""
node_update=""

if [ "$language" = "uk" ]; then
	PS3='Виберіть опцію: '
	options=("Встановити ноду" "Оновити ноду" "Вийти з меню")
	selected="Ви вибрали опцію"
else
	PS3='Enter your option: '
	options=("Install the node" "Update the node" "Quit")
	selected="You choose the option"
fi

select opt in "${options[@]}"
do
    case $opt in
        "${options[0]}")
            echo "$selected $opt"
            ;;
        "${options[1]}")
            echo "$selected $opt"
            ;;
        "${options[2]}")
			echo "$selected $opt"
            break
            ;;
        *) echo "unknown option $REPLY";;
    esac
done