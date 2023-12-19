#!/bin/bash

# 1. E - mail
# 2. KES 11 update
# 3. Users
# 4. Архив баз 1С
# 5. Видеоматериалы и презентации
# 6. Входящая и исходящая корреспонденция
# 7. Государственные торги
# 8. Должностные инструкции
# 9. Картографические материалы
#10. Лесные пожары
#11. Общие документы
#12. Оперативная информация
#13. Паспорта автотехники
#14. Программное обеспечение
#15. Система управления охраной труда
#16. Счетная палата
#17. Табеля РДС
#18. Учебный центр
#19. Учредительная и руководящая документация
#20. Якутское АО




connect_network_folders () {
	
	passwd=$(zenity --forms --title="Пароль для администратора" \
        --text="Введите пароль администратора" \
        --add-password="Пароль")
    check_cancel   
	network_folder_text=$(curl "https://raw.githubusercontent.com/GavriilSleptsov/aviales/main/text_for_zenity/network_folder")
	echo $passwd | sudo -S -c 'cat <<EOL >> /etc/fstab
#//192.168.0.200/Общие\040документы /media/aviales/Общие\040документы cifs username=tornado,password=torsys,iocharset=utf8,nofail,_netdev,file_mode=0777,dir_mode=0777 0 0
EOL'

	
	$(zenity --info --text="$network_folder_text" --height=350 --width=500)	
}