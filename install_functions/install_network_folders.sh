#!/bin/bash

connect_network_folders () {
    passwd=$(zenity --forms --title="Пароль для администратора" \
        --text="Введите пароль администратора" \
        --add-password="Пароль")
    
    check_cancel
	echo "$passwd" | sudo -S mkdir -p /media/aviales/Общие\ документы
    network_folder_text=$(curl "https://raw.githubusercontent.com/GavriilSleptsov/aviales/main/text_for_zenity/network_folder")
	
    echo "$passwd" | sudo -S sh -c 'cat <<EOL >> /etc/fstab
#
# -- Общие документы --
#//192.168.0.202/E-mail /media/aviales/E-mail cifs username=tornado,password=torsys,iocharset=utf8,nofail,_netdev,file_mode=0777,dir_mode=0777 0 0
# -- Архив баз 1С
#//192.168.0.202/Архив\040баз\0401С /media/aviales/Архив\040баз\0401С cifs username=tornado,password=torsys,iocharset=utf8,nofail,_netdev,file_mode=0777,dir_mode=0777 0 0
# -- Видеоматериалы и презентации
#//192.168.0.202/Видеоматериалы\040и\040презентации /media/aviales/Видеоматериалы\040и\040презентации cifs username=tornado,password=torsys,iocharset=utf8,nofail,_netdev,file_mode=0777,dir_mode=0777 0 0
# -- Входящая и исходящая корреспонденция
#//192.168.0.202/Входящая\040и\040исходящая\040корреспонденция /media/aviales/Входящая\040и\040исходящая\040корреспонденция cifs username=tornado,password=torsys,iocharset=utf8,nofail,_netdev,file_mode=0777,dir_mode=0777 0 0
# -- Государственные торги
#//192.168.0.202/Государственные\040торги /media/aviales/Государственные\040торги cifs username=tornado,password=torsys,iocharset=utf8,nofail,_netdev,file_mode=0777,dir_mode=0777 0 0
# -- Должностные инструкции
#//192.168.0.202/Должностные\040инструкции /media/aviales/Должностные\040инструкции cifs username=tornado,password=torsys,iocharset=utf8,nofail,_netdev,file_mode=0777,dir_mode=0777 0 0
# -- Картографические материалы
#//192.168.0.202/Картографические\040материалы /media/aviales/Картографические\040материалы cifs username=tornado,password=torsys,iocharset=utf8,nofail,_netdev,file_mode=0777,dir_mode=0777 0 0
# -- Лесные пожары
#//192.168.0.202/Лесные\040пожары /media/aviales/Лесные\040пожары cifs username=tornado,password=torsys,iocharset=utf8,nofail,_netdev,file_mode=0777,dir_mode=0777 0 0
# -- Общие документы
#//192.168.0.202/Общие\040документы /media/aviales/Общие\040документы cifs username=tornado,password=torsys,iocharset=utf8,nofail,_netdev,file_mode=0777,dir_mode=0777 0 0
# -- Оперативная информация
#//192.168.0.202/Оперативная\040информация /media/aviales/Оперативная\040информация cifs username=tornado,password=torsys,iocharset=utf8,nofail,_netdev,file_mode=0777,dir_mode=0777 0 0
# -- Паспорта автотехники
#//192.168.0.202/Паспорта\040автотехники /media/aviales/Паспорта\040автотехники cifs username=tornado,password=torsys,iocharset=utf8,nofail,_netdev,file_mode=0777,dir_mode=0777 0 0
# -- Программное обеспечение
#//192.168.0.202/Программное\040обеспечение /media/aviales/Программное\040обеспечение cifs username=tornado,password=torsys,iocharset=utf8,nofail,_netdev,file_mode=0777,dir_mode=0777 0 0
# -- Система управления охраной труда
#//192.168.0.202/Система\040управления\040охраной\040труда /media/aviales/Система\040управления\040охраной\040труда cifs username=tornado,password=torsys,iocharset=utf8,nofail,_netdev,file_mode=0777,dir_mode=0777 0 0
# -- Счетная палата
#//192.168.0.202/Счетная\040палата /media/aviales/Счетная\040палата cifs username=tornado,password=torsys,iocharset=utf8,nofail,_netdev,file_mode=0777,dir_mode=0777 0 0
# -- Табеля РДС
#//192.168.0.202/Табеля\040РДС /media/aviales/Табеля\040РДС cifs username=tornado,password=torsys,iocharset=utf8,nofail,_netdev,file_mode=0777,dir_mode=0777 0 0
# -- Учебный центр
#//192.168.0.202/Учебный\040центр /media/aviales/Учебный\040центр cifs username=tornado,password=torsys,iocharset=utf8,nofail,_netdev,file_mode=0777,dir_mode=0777 0 0
# -- Учредительная и руководящая документация
#//192.168.0.202/Учредительная\040и\040руководящая\040документация /media/aviales/Учредительная\040и\040руководящая\040документация cifs username=tornado,password=torsys,iocharset=utf8,nofail,_netdev,file_mode=0777,dir_mode=0777 0 0
# -- Якутское АО
#//192.168.0.202/Якутское\040АО /media/aviales/Якутское\040\АО cifs username=tornado,password=torsys,iocharset=utf8,nofail,_netdev,file_mode=0777,dir_mode=0777 0 0
EOL'

    zenity --error --text="$network_folder_text" --height=250 --width=350
}