install_app_saby_plugin() {
	file_path="/usr/share/applications/Sbis3Plugin.desktop"
	if [ -e "$file_path" ]; then
		$(zenity --info --text="Пакет уже установлен!" --height=100 --width=160)
		check_cancel
	else 
		passwd=$(zenity --password)
		check_cancel
		file="/home/$USER/Desktop/sabyapps-setup"
		zenity --auto-close &
		(
			wget https://slepsov.ru/aitekinfo/sabyapps-setup -P /home/$USER/Desktop/
			# Проверка кода завершения wget
			if [ $? -eq 0 ]; then
				zenity --info --title="Успех" --text="Файл успешно загружен!"
			else
				zenity --error --title="Ошибка" --text="Ошибка при загрузке файла."
				exit 1
			fi
		) | zenity --progress --pulsate --title "Загрузка пакета" --text="Подождите, идет загрузка..." --auto-close
		
		# Установка пакета
		zenity --auto-close &
		(
			# Установка пакета с использованием sudo и передачей пароля через stdin
			echo $passwd | sudo -S chmod +x /home/$USER/Desktop/sabyapps-setup
			fly-term -e "sudo /home/$USER/Desktop/sabyapps-setup"
			# Получение кода завершения установки
			exit_code=$?
			# Проверка кода завершения и отображение соответствующего сообщения
			zenity --info --title="Успех" --text="Пакет успешно установлен!"
			cp $file_path /home/$USER/Desktop
		) | zenity --progress --pulsate --title "Установка пакета" --text="Подождите, идет установка..." --auto-close
		# Проверка наличия файла перед удалением
		if [ -e "$file" ]; then
			rm "$file"
		fi
	fi
}