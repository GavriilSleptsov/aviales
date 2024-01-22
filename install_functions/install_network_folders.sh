#!/bin/bash

create_folder_for_network_folders () {
	if [ -d /etc/skel/Desktop/Сетевые\ папки ]; then
		echo "Папка уже существует. Ничего не нужно делать."
	else
		mkdir /etc/skel/Desktop/Сетевые\ папки
	fi
}

connect_network_folders () {
	#!/bin/bash

	# Показываем диалоговое окно с чекбоксами
	selected_options=$(zenity --list --checklist \
		--title="Выберите сетевые папки" \
		--text="Выберите нужные сетевые папки, которые нужно подключить:" \
		--column="Выбрать" --column="Сетевая папка" \
		FALSE "sharetest" \
		FALSE "folders" \
		FALSE "gto" \
		--separator=":" \
		--width=500 --height=400);

	# Проверяем, были ли выбраны какие-либо опции
	if [ -n "$selected_options" ]; then
		credentials_for_netfolders="cifs,user=admin,password=P@ssw0rd,iocharset=utf8,dir_mode=0777,file_mode=0777,_netdev,nofail 0 0"
		create_folder_for_network_folders
		IFS=':' read -ra options_array <<< "$selected_options"
		for option in "${options_array[@]}"; do
			case $option in
				"sharetest")
					mkdir -p /media/yakutia/sharetest
					echo "//192.168.0.200/sharetest /media/yakutia/sharetest $credentials_for_netfolders"
					;;
				"folders")
					echo "Выбрана Опция 2"
					;;
				"gto")
					echo "Выбрана Опция 3"
					;;
				*)
					# Обработка для других опций (если есть)
					;;
			esac
		done
	fi
}