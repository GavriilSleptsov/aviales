#!/bin/bash

connect_network_folders () {
	check_network_folder_connected() {
	
		local program_name=$1
		
		# Имя монтируемой папки
		folder_mount_name=Users/
		
		# Данные для монтирования
		mount_credentials=cifs username=tornado,password=torsys,iocharset=utf8,file_mode=0777,dir_mode=0777 0 0
	
		# Строка, которую вы ищете в /etc/fstab
		earch_string="//192.168.0.2/$folder_mount_name /media/aviales/$folder_mount_name $mount_credentials"

		# Строка из /etc/fstab
		fstab_line=$(grep "$search_string" /etc/fstab)

		# Проверяем наличие строки в /etc/fstab
		if [[ "$fstab_line" == "$search_string" ]]; then
			return 0
		else
			return 1
		fi
	}
	
	# Используем Zenity для отображения результата
	#zenity --list \
	#--checklist \
	#--column "checkbox" \
	#--column "Result" \
	#FALSE "$result"
	
	# Проверяем и добавляем программы в массив
	if check_network_folder_connected "Users"; then
		touch /home/$USER/Desktop/true.txt
	else
		touch /home/$USER/Desktop/false.txt
	fi
}