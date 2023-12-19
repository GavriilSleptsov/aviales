#!/bin/bash

connect_network_folders () {
    passwd=$(zenity --forms --title="Пароль для администратора" \
        --text="Введите пароль администратора" \
        --add-password="Пароль")
    
    check_cancel

    network_folder_text=$(curl "https://raw.githubusercontent.com/GavriilSleptsov/aviales/main/text_for_zenity/network_folder")

    echo "$passwd" | sudo -S sh -c 'cat <<EOL >> /etc/fstab
# -- Общие документы --
#//192.168.0.200/Общие\040документы /media/aviales/Общие\040документы cifs username=tornado,password=torsys,iocharset=utf8,nofail,_netdev,file_mode=0777,dir_mode=0777 0 0
#
#//192.168.0.200/Общие\040документы /media/aviales/Общие\040документы cifs username=tornado,password=torsys,iocharset=utf8,nofail,_netdev,file_mode=0777,dir_mode=0777 0 0
EOL'

    zenity --info --text="$network_folder_text" --height=350 --width=500
}