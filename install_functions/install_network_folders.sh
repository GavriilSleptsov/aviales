#!/bin/bash
connect_network_folders () {
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

	# Проверяем, были ли выбраны какие-либо шары
	if [ -n "$selected_options" ]; then
		passwd=$(zenity --password)
		if [ -d "/etc/skel/Desktop/Сетевые\ папки" ]; then
			echo "Папка уже существует."
		else
			echo $passwd | sudo -S mkdir /etc/skel/Desktop/Сетевые\ папки
			echo $passwd | sudo -S touch /etc/skel/Desktop/Сетевые\ папки/.directory
			echo $passwd | sudo -S tee -a "/etc/skel/Desktop/Сетевые папки/.directory" <<EOF
[Desktop Entry]
Type=Directory
NoDisplay=false
Icon=prefences-system-network-sharing
Hidden=false
EOF
		fi
		credentials_for_netfolders="cifs user=admin,password=P@ssw0rd,iocharset=utf8,dir_mode=0777,file_mode=0777,_netdev,nofail 0 0"
		IFS=':' read -ra options_array <<< "$selected_options"
		for option in "${options_array[@]}"; do
			case $option in
				"sharetest")
					echo $passwd | sudo  mkdir -p /media/yakutia/sharetest
					echo $passwd | sudo -S tee -a "/etc/fstab" <<EOF
//192.168.0.200/sharetest /media/yakutia/sharetest $credentials_for_netfolders
EOF
					echo $passwd | sudo -S ln -s /media/yakutia/sharetest "/etc/skel/Desktop/Сетевые папки"
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
			echo $passwd | sudo -S mount -a
		done
	fi
}