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

# Фиксированные данные для монтирования
mount_credentials="cifs username=tornado,password=torsys,iocharset=utf8,nofail,_netdev,file_mode=0777,dir_mode=0777 0 0"

connect_network_folders () {
	passwd=$(zenity --password)
	echo $passwd | sudo -S cp /etc/fstab /etc/fstab.backup
	check_network_folder_connected() {
	
		# Имя монтируемой папки
		folder_mount_name=$1
	
		# Строка, которую вы ищете в /etc/fstab
		search_string="//192.168.0.200/$folder_mount_name /media/aviales/$folder_mount_name $mount_credentials"

		# Строка из /etc/fstab
		fstab_line=$(grep "$search_string" /etc/fstab)

		# Проверяем наличие строки в /etc/fstab
		if [[ "$fstab_line" == "$search_string" ]]; then
			return 0
		else
			return 1
		fi
	}
	
	check_checkbox() {
		if [ "$network_folder1" == "TRUE" ]; then
			echo $passwd | sudo -S sed -i "s|#//192.168.0.200/Общие\040документы/ /media/aviales/Общие\040документы/ $mount_credentials|//192.168.0.200/Общие\040документы/ /media/aviales/Общие\040документы/ $mount_credentials|g" /etc/fstab
		else
			echo $passwd | sudo -S sed -i "s|//192.168.0.200/Общие\040документы/ /media/aviales/Общие\040документы/ $mount_credentials|#//192.168.0.200/Общие\040документы/ /media/aviales/Общие\040документы/ $mount_credentials|g" /etc/fstab
		fi
	 }
	
	# Проверяем и добавляем программы в массив
	if check_network_folder_connected "Общие\040документы/"; then
		network_folder1=TRUE
	else
		network_folder1=FALSE
	fi
	
	zenity --list \
	--checklist \
	--column "Выберите" \
	--column "Общие папки" \
	$network_folder1 Users
	check_checkbox
}